import { Link } from "@inertiajs/react";

import type { MunicipalityBase, InertiaResponse } from "@/types/api";

interface MunicipalityWithPath extends MunicipalityBase {
  all_prefecture_municipalities_path: string;
  parent_prefecture_path: string;
}

interface MunicipalityProps extends InertiaResponse {
  municipality: MunicipalityWithPath;
}

export default function MunicipalityShow({ municipality }: MunicipalityProps) {
  return (
    <>
      <div className="flex flex-col gap-2">
        <div>
          <p>
            <Link href={municipality.all_prefecture_municipalities_path}>
              Back to municipalities
            </Link>
          </p>
        </div>
        <div>
          <p>{municipality.eng_name}</p>
          <p>{municipality.kanji_name}</p>
          <p>{municipality.kana_name}</p>
          <p>{municipality.municipality_type}</p>
        </div>
      </div>
    </>
  );
}
