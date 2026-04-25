interface ResultsProps {
  material_category_data: {
    data: {
      municipality_id: number;
      categories: Array<{
        category_name: string;
        display_name: string;
        item_rule_data: Array<{ rule_id: number }>;
      }>;
    };
  };
  text_search_data: {
    search_term: string;
    data: Array<{ id: number }> | null;
  };
  p_name: string;
  m_name: string;
}

export default function SearchResults({
  material_category_data,
  text_search_data,
  p_name,
  m_name,
}: ResultsProps) {
  const asd = material_category_data;
  const foo = text_search_data;
  return (
    <div>
      hello - {p_name} - {m_name}
    </div>
  );
}
