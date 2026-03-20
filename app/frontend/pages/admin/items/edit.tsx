import { Form, Link } from "@inertiajs/react";

import type { ItemBase, InertiaResponse } from "@/types/api";

interface ItemWithPath extends ItemBase {
  member_item_path: string;
}

interface ItemProps extends InertiaResponse {
  item: ItemWithPath;
}

export default function ItemEdit({ item }: ItemProps) {
  return (
    <>
      <div className="flex flex-col gap-2">
        <div>
          <p>
            <Link href={item.member_item_path}>Back to items page</Link>
          </p>
          <p>Editing item - {item.eng_name}</p>
        </div>
        <Form action={`/admin/items/${item.id}`} method="put">
          <div className="flex flex-col">
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
          </div>
          <div>
            <button type="submit">Submit</button>
          </div>
        </Form>
      </div>
    </>
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
