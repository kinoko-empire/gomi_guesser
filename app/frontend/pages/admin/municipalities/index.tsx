import { Link } from "@inertiajs/react";

import type { MunicipalityBase, InertiaResponse } from "@/types/api";

interface MunicipalityWithPath extends MunicipalityBase {
  municipality_path: string;
}

interface MunicipalityListData extends InertiaResponse {
  municipalities: Array<MunicipalityWithPath>;
}

export default function MunicipalitiesIndex({
  municipalities,
}: MunicipalityListData) {
  return (
    <>
      <div>
        {municipalities.length ? (
          <table className="w-full">
            <thead>
              <tr>
                <th className="border-b border-gray-200 p-4 pt-0 pb-3 pl-8 text-left font-medium">
                  English Name
                </th>
                <th className="border-b border-gray-200 p-4 pt-0 pb-3 text-left font-medium">
                  Kanji Name
                </th>
                <th className="border-b border-gray-200 p-4 pt-0 pr-8 pb-3 text-left font-medium">
                  Kana Reading
                </th>
              </tr>
              {municipalities.map((m) => {
                return (
                  <tr key={m.eng_name}>
                    <td className="border-b border-gray-100 p-4 pl-8 dark:border-gray-700">
                      <Link href={m.municipality_path}>{m.eng_name}</Link>
                    </td>
                    <td className="border-b border-gray-100 p-4 dark:border-gray-700">
                      <Link href={m.municipality_path}>{m.kanji_name}</Link>
                    </td>
                    <td className="border-b border-gray-100 p-4 pr-8 dark:border-gray-700">
                      {m.kana_name}
                    </td>
                  </tr>
                );
              })}
            </thead>
          </table>
        ) : null}
      </div>
    </>
  );
}
