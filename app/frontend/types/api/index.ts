export interface MunicipalityBase {
  id: number;
  municipality_type: string;
  prefecture_id: number;
  eng_name: string;
  alphanumeric_eng_name: string;
  info_url?: string;
  kana_name: string;
  kanji_name: string;
  created_at: string;
  updated_at: string;
}

export interface PrefectureBase {
  id: number;
  eng_name: string;
  alphanumeric_eng_name: string;
  kana_name: string;
  kanji_name: string;
  created_at: string;
  updated_at: string;
}

export interface ItemBase {
  id: number;
  eng_name: string;
  kana_name?: string;
  kanji_name?: string;
}

// looking at reddit comments from below for api response and http error shapes
// https://www.reddit.com/r/typescript/comments/xospwb/are_there_ts_community_conventions_for_api/
export interface HttpError {
  code: string;
  message: string;
}

export interface InertiaResponse {
  errors: Array<string>;
}
