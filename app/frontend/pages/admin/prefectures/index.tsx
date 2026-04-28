import type { PrefectureBase, InertiaResponse } from "@/types/api";
import LinkBtn from "@/components/LinkBtn";

interface PrefectureWithPath extends PrefectureBase {
  prefecture_path: string;
}

interface PrefectureListData extends InertiaResponse {
  prefectures: Array<PrefectureWithPath>;
}

export default function PrefecturesIndex({
  prefectures,
  errors,
}: PrefectureListData) {
  return (
    <div>
      <ErrorsContainer errors={errors} />
      {prefectures.length ? (
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
            {prefectures.map((p) => {
              return (
                <tr key={p.eng_name}>
                  <td className="border-b border-gray-100 p-4 pl-8 dark:border-gray-700">
                    <LinkBtn href={p.prefecture_path}>
                      {p.eng_name}
                    </LinkBtn>
                  </td>
                  <td className="border-b border-gray-100 p-4 dark:border-gray-700">
                    <LinkBtn href={p.prefecture_path}>
                      {p.kanji_name}
                    </LinkBtn>
                  </td>
                  <td className="border-b border-gray-100 p-4 pr-8 dark:border-gray-700">
                    {p.kana_name}
                  </td>
                </tr>
              );
            })}
          </thead>
        </table>
      ) : (
        <div>No prefecture data</div>
      )}
    </div>
  );
}

function ErrorsContainer({ errors }: { errors: Array<string> }) {
  return errors.length > 0 ? (
    <div>
      <ul>
        {errors.map((e) => {
          return (
            <li key={e}>
              <p>{e}</p>
            </li>
          );
        })}
      </ul>
    </div>
  ) : null;
}
