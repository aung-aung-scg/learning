import { SidebarInset, SidebarProvider } from "@/components/ui/sidebar";
import { Outlet } from "react-router-dom";
import AppSidebar from "./AppSidebar";
import NavBar from "./Navbar";

const Main = () => {
  return (
    <SidebarProvider>
      <AppSidebar />
      <SidebarInset>
        <NavBar />
        <main className="mt-[80px] m-4">
          <Outlet />
        </main>
      </SidebarInset>
    </SidebarProvider>
  );
};

export default Main;
