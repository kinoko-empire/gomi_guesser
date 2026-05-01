import type { ItemBase, InertiaResponse } from "@/types/api";

import LinkBtn from "@/components/LinkBtn";

interface ItemWithPath extends ItemBase {
  item_path: string;
}
interface ItemsProps extends InertiaResponse {
  items: Array<ItemWithPath>;
  new_item_path: string;
}

export default function ItemsIndex({ items, new_item_path }: ItemsProps) {
  return (
    <section className="flex flex-col gap-2 items-center w-1/2 pt-10">
      <div className="flex justify-between align-text-end w-full bg-gray-50 p-4">
        <h1>Displaying all garbage:</h1>
        <LinkBtn href={new_item_path}>Add new garbage</LinkBtn>
      </div>
      <ul className="p-4">
        {items.length > 0 ? (
          items.map((item) => {
            return (
              <li key={item.id}>
                <LinkBtn href={item.item_path}>{item.eng_name}</LinkBtn>
              </li>
            );
          })
        ) : (
          <li>
            <p>No items to display</p>
          </li>
        )}
      </ul>
    </section>
  );
}
