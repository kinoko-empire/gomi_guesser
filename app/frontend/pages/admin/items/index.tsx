import { Link } from "@inertiajs/react";

import type { ItemBase, InertiaResponse } from "@/types/api";

interface ItemWithPath extends ItemBase {
  item_path: string;
}
interface ItemsProps extends InertiaResponse {
  items: Array<ItemWithPath>;
  new_item_path: string;
}

export default function ItemsIndex({ items, new_item_path }: ItemsProps) {
  return (
    <>
      <div>
        <Link href={new_item_path}>Create new item</Link>
        <h1>Displaying all items:</h1>
        <ul>
          {items.length > 0 ? (
            items.map((item) => {
              return (
                <li key={item.id}>
                  <Link href={item.item_path}>{item.eng_name}</Link>
                </li>
              );
            })
          ) : (
            <li>
              <p>No items to display</p>
            </li>
          )}
        </ul>
      </div>
    </>
  );
}
