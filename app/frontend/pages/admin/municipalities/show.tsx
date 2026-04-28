import type { MunicipalityBase, InertiaResponse } from "@/types/api";
import LinkBtn from "@/components/LinkBtn";
import BackBanner from "@/components/BackBanner";

interface MunicipalityWithPath extends MunicipalityBase {
  all_prefecture_municipalities_path: string;
  parent_prefecture_path: string;
}

interface MunicipalityProps extends InertiaResponse {
  municipality: MunicipalityWithPath;
}

export default function MunicipalityShow({ municipality }: MunicipalityProps) {
  return (
    <div className="flex flex-col w-full items-center gap-2">
      <BackBanner>
        <LinkBtn href={municipality.all_prefecture_municipalities_path}>
          Back to municipalities
        </LinkBtn>
      </BackBanner>
      <section className="flex flex-col gap-2 w-1/4 items-center">
        <p>{municipality.eng_name}</p>
        <p>{municipality.kanji_name}</p>
        <p>{municipality.kana_name}</p>
        <p>{municipality.municipality_type}</p>
      </section>
    </div>
  );
}
