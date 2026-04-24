import { Form } from "@inertiajs/react";
import { useState } from "react";

import type { MunicipalityBase } from "@/types/api";

type MunicipalityData = Pick<
  MunicipalityBase,
  "id" | "eng_name" | "prefecture_id"
>;

type PrefectureData = {
  [key: string]: {
    prefecture_id: number;
    municipalities: Array<MunicipalityData>;
  };
};

interface PageProps {
  prefecture_list: PrefectureData;
}

function maybePrefectureData(
  a: unknown,
): a is { prefecture_id: number; municipalities: Array<MunicipalityData> } {
  return (
    a !== undefined &&
    a !== null &&
    a instanceof Object &&
    "prefecture_id" in a &&
    typeof a.prefecture_id === "number" &&
    "municipalities" in a &&
    maybeMunicipalityType(a.municipalities)
  );
}

function maybeMunicipalityType(
  maybeMunicipality: unknown,
): maybeMunicipality is MunicipalityData {
  return Array.isArray(maybeMunicipality);
}

export default function ItemsIndex({ prefecture_list }: PageProps) {
  const [prefectureName, setPrefectureName] = useState("");

  const prefecturesMunicipalities = Object.entries(prefecture_list);

  const prefecturesWithMunicipalityData = prefecturesMunicipalities.filter(
    (pref) => pref[1].municipalities.length > 0,
  );

  return (
    <div>
      <div>
        <p>
          Select a prefecture and one of its municipalities to begin searching.
          Optionally, enter a search term. Currently, only data for Tokyo is
          available.
        </p>
      </div>
      <Form action="/search/results">
        <select
          name="prefecture_name"
          onChange={(e) => setPrefectureName(e.target.value)}
          required
        >
          {[
            // provide a default option so that we can make the prefecture selection required
            <option key="default_option" value="">
              Choose a prefecture
            </option>,
            ...prefecturesWithMunicipalityData.map(
              ([prefectureName, prefectureData]) => {
                if (maybePrefectureData(prefectureData) && Array.isArray([])) {
                  return (
                    <option key={prefectureName} value={prefectureName}>
                      {prefectureName}
                    </option>
                  );
                }
              },
            ),
          ]}
        </select>
        {prefectureName &&
        prefecture_list[prefectureName].municipalities.length > 0 ? (
          <select name="municipality_name" required>
            {[
              <option key="default_option" value="">
                Choose a municipality
              </option>,
              ...prefecture_list[prefectureName].municipalities.map((m) => {
                return <option key={m.id}>{m.eng_name}</option>;
              }),
            ]}
          </select>
        ) : (
          <p>No municipality data to show</p>
        )}
        <label htmlFor="text_search">Search term</label>
        <input name="text_search" />
        <button>Search</button>
      </Form>
    </div>
  );
}
