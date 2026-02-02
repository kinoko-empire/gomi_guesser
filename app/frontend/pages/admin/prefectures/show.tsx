import { Link } from "@inertiajs/react";

import type { PrefectureBase, InertiaResponse } from "@/types/api";

interface PrefectureWithPath extends PrefectureBase {
  edit_prefecture_path: string;
  all_prefectures_path: string;
  view_municipalities_path: string;
}

interface PrefectureProps extends InertiaResponse {
  prefecture: PrefectureWithPath;
}

export default function PrefectureShow({ prefecture }: PrefectureProps) {
  console.log(prefecture);
  return (
    <>
      <div className="flex flex-col gap-2">
        <div>
          <p>
            <Link href={prefecture.all_prefectures_path}>
              Back to prefectures list
            </Link>
          </p>
          <p>
            <Link href={prefecture.view_municipalities_path}>
              View municipalities
            </Link>
          </p>
        </div>
        <div>
          <p>{prefecture.eng_name}</p>
          <p>{prefecture.kanji_name}</p>
          <p>{prefecture.kana_name}</p>
        </div>
        <p>
          <Link href={prefecture.edit_prefecture_path}>Edit</Link>
        </p>
      </div>
    </>
  );
}
