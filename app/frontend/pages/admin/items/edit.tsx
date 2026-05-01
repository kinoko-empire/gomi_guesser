import { Form } from "@inertiajs/react";

import type { ItemBase, InertiaResponse } from "@/types/api";
import LinkBtn from "@/components/LinkBtn";
import BackBanner from "@/components/BackBanner";

interface ItemWithPath extends ItemBase {
  member_item_path: string;
}

interface ItemProps extends InertiaResponse {
  item: ItemWithPath;
}

export default function ItemEdit({ item }: ItemProps) {
  return (
    <div className="flex flex-col w-full items-center gap-2">
      <BackBanner>  
        <LinkBtn href={item.member_item_path}>Back to items page</LinkBtn>
      </BackBanner>
      <section className="flex flex-col gap-2 w-1/2">
        <h1>Editing item - {item.eng_name}</h1>
        <Form action={`/admin/items/${item.id}`} method="put" className="flex flex-col gap-1">
          <label className="flex flex-col">
            English Name:
            <input name="eng_name" type="text" defaultValue={item.eng_name} />
          </label>
          <label className="flex flex-col">
            Kanji name:
            <input
              name="kanji_name"
              type="text"
              defaultValue={item.kanji_name}
            />
          </label>
          <label className="flex flex-col">
            Kana name:
            <input
              name="kana_name"
              type="text"
              defaultValue={item.kana_name}
            />
          </label>
          <button type="submit" className="self-start">Submit</button>
        </Form>
      </section>
    </div>
  );
}

// export default function ItemEdit({ item }: ItemProps) {
//   return (
//     <>
//       <div>
//         <h1>Item edit page</h1>
//       </div>
//     </>
//   );
// }
