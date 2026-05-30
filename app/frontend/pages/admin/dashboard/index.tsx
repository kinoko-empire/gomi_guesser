import LinkBtn from "@/components/LinkBtn";

interface DashboardProps {
  prefectures_path: string;
  items_path: string;
}

export default function AdminDashboard({
  prefectures_path,
  items_path,
}: DashboardProps) {
  return (
    <>
      <div>
        <h1>Admin dashboard</h1>
        <div>
          <LinkBtn href={prefectures_path}>Prefectures</LinkBtn>
          <LinkBtn href={items_path}>Items</LinkBtn>
        </div>
      </div>
    </>
  );
}
