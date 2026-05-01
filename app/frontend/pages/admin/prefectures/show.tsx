import type { PrefectureBase, InertiaResponse } from "@/types/api";
import LinkBtn from "@/components/LinkBtn";
import BackBanner from "@/components/BackBanner";

interface PrefectureWithPath extends PrefectureBase {
  all_prefectures_path: string;
  view_municipalities_path: string;
}

interface PrefectureProps extends InertiaResponse {
  prefecture: PrefectureWithPath;
}

export default function PrefectureShow({ prefecture }: PrefectureProps) {
  return (
    <div className="flex flex-col w-full items-center gap-2">
      <BackBanner>
        <LinkBtn href={prefecture.all_prefectures_path}>
          Back to prefectures list
        </LinkBtn>
      </BackBanner>
      <section>
        <div className="pb-4">
          <p>{prefecture.eng_name}</p>
          <p>{prefecture.kanji_name}</p>
          <p>{prefecture.kana_name}</p>
        </div>
        <LinkBtn href={prefecture.view_municipalities_path}>
          View municipalities
        </LinkBtn>
      </section>
    </div>
  );
}
