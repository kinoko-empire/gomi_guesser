import { Form } from "@inertiajs/react";

import type { InertiaResponse } from "@/types/api";
import LinkBtn from "@/components/LinkBtn";
import BackBanner from "@/components/BackBanner";

interface ItemProps extends InertiaResponse {
  admin_items_path: string;
}

// not currently rendering edit route, but have component built out
export default function ItemNew({ admin_items_path }: ItemProps) {
  return (
    <div className="flex flex-col w-full items-center gap-2">
      <BackBanner>
        <LinkBtn href={admin_items_path}>Back to all items</LinkBtn>
      </BackBanner>
      <section className="flex flex-col gap-2">
        <Form action={admin_items_path} method="post">
          <div className="flex flex-col">
            <label className="flex flex-col">
              English Name:
              <input name="item[eng_name]" type="text" />
            </label>
            <label className="flex flex-col">
              Kanji name:
              <input name="item[kanji_name]" type="text" />
            </label>
            <label className="flex flex-col">
              Kana name:
              <input name="item[kana_name]" type="text" />
            </label>
          </div>
          <button type="submit">Submit</button>
        </Form>
      </section>
    </div>
  );
}
