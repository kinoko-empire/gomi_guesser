import { Form, Link } from "@inertiajs/react";

import type { PrefectureBase, InertiaResponse } from "@/types/api";

interface PrefectureWithPath extends PrefectureBase {
  member_prefecture_path: string;
}

interface PrefectureProps extends InertiaResponse {
  prefecture: PrefectureWithPath;
}

export default function PrefectureEdit({ prefecture }: PrefectureProps) {
  return (
    <>
      <div className="flex flex-col gap-2">
        <div>
          <p>
            <Link href={prefecture.member_prefecture_path}>
              Back to prefecture page
            </Link>
          </p>
          <p>Editing {prefecture.eng_name} prefecture</p>
        </div>
        <Form action={`/admin/prefectures/${prefecture.id}`} method="put">
          <div className="flex flex-col">
            <label className="flex flex-col">
              English Name:
              <input
                name="eng_name"
                type="text"
                defaultValue={prefecture.eng_name}
              />
            </label>
            <label className="flex flex-col">
              Alphanumeric English name (for sorting):
              <input
                name="alphanumeric_eng_name"
                type="text"
                defaultValue={prefecture.alphanumeric_eng_name}
              />
            </label>
            <label className="flex flex-col">
              Kanji name:
              <input
                name="kanji_name"
                type="text"
                defaultValue={prefecture.kanji_name}
              />
            </label>
            <label className="flex flex-col">
              Kana name:
              <input
                name="kana_name"
                type="text"
                defaultValue={prefecture.kana_name}
              />
            </label>
          </div>
          <div>
            <button type="submit">Submit</button>
          </div>
        </Form>
      </div>
    </>
  );
}
