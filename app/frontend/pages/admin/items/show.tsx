import { useState } from "react";
import type { ReactNode } from "react";

import type { ItemBase, InertiaResponse } from "@/types/api";
import LinkBtn from "@/components/LinkBtn";
import BackBanner from "@/components/BackBanner";

interface ItemWithPath extends ItemBase {
  items_index_path: string;
  item_edit_path: string;
  item_path: string;
}

interface ItemProps extends InertiaResponse {
  item: ItemWithPath;
}

function DeleteButtonLink({
  href,
  children,
}: {
  href: string;
  children: ReactNode;
}) {
  return (
    <LinkBtn
      className="p-2 bg-red-500 rounded-xs sm:flex-1 md:flex-[0_1_100px]"
      href={href}
      method="delete"
    >
      {children}
    </LinkBtn>
  );
}

export default function ItemShow({ item }: ItemProps) {
  const [showDelete, setShowDelete] = useState(false);

  return (
    <div className="w-full flex flex-col items-center">
      <BackBanner>
        <LinkBtn href={item.items_index_path}>
            Back to all items
        </LinkBtn>
      </BackBanner>
      <section className="flex justify-between w-1/3">
        <div className="flex flex-col gap-2">
          <p>English name: {item.eng_name}</p>
          <p>Kanji name: {item.kanji_name ?? "N/A"}</p>
          <p>Kana name: {item.kana_name ?? "N/A"}</p>
        </div>
        <div className="flex flex-col gap-2 items-end">
          <LinkBtn href={item.item_edit_path}>Edit</LinkBtn>
          <div className="flex flex-col items-end">
            <button onClick={() => setShowDelete(true)}>Delete</button>
            {showDelete ? (
              <div className="flex flex-col md:flex-row gap-2 md:gap-4">
                <DeleteButtonLink href={item.item_path}>Confirm</DeleteButtonLink>
                {/* 
                  break out cancel button into a Button component later?
                  could use methods in this article - https://typeofnan.dev/conditional-component-props-react/
                  for handling different types of props for different types of buttons
                */}
                <button
                  className="p-2 bg-gray-200 rounded-xs sm:flex-1 md:flex-[0_1_100px]"
                  onClick={() => setShowDelete(false)}
                >
                  Cancel
                </button>
              </div>
            ) : null}
          </div>
        </div>
      </section>
    </div>
  );
}
