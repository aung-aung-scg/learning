import {
  Collapsible,
  CollapsibleContent,
  CollapsibleTrigger,
} from "@/components/ui/collapsible";
import { Icons } from "@/components/ui/icons";
import {
  Sidebar,
  SidebarContent,
  SidebarGroupContent,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarMenuSub,
  SidebarMenuSubButton,
  SidebarMenuSubItem,
} from "@/components/ui/sidebar";
import { cn } from "@/lib/utils";
import { NavLink, useLocation } from "react-router-dom";

const sidebarItems = [
  {
    title: "Dashboard",
    url: "/admin",
    icon: Icons.dashboard,
  },
  {
    title: "Reports",
    url: "/admin/reports",
    icon: Icons.chartNoAxesCombined,
  },
  {
    title: "Learning Management",
    url: "#",
    icon: Icons.shoppingBag,
    items: [
      {
        title: "Material",
        url: "/admin/subjects",
      },
      {
        title: "Completion Certificate",
        url: "/admin/certificates",
      },
      {
        title: "IP Restriction Setting",
        url: "/admin/ipaddresses",
      },
    ],
  },
  {
    title: "User Management",
    url: "#",
    icon: Icons.users,
    items: [
      {
        title: "Users",
        url: "/admin/users",
      },
      {
        title: "Roles",
        url: "/admin/roles",
      },
      {
        title: "Groups",
        url: "/admin/groups",
      },
    ],
  },
];

const AppSidebar = () => {
  const location = useLocation();

  return (
    <Sidebar>
      <SidebarHeader className="text-white admin-sidebar">
        <div className="flex flex-col items-center">
          <div className="px-12 py-2 border bg-white rounded-md mb-2">
            <NavLink to="/admin">
              <img
                src="/src/assets/images/logo.png"
                alt="Logo"
                className="w-[100px]"
              />
            </NavLink>
          </div>
          <span className="px-5 font-bold border bg-white rounded-lg text-sky-900">
            LMS
          </span>
        </div>
      </SidebarHeader>
      <SidebarContent className="text-white">
        <SidebarGroupContent>
          <SidebarMenu>
            {sidebarItems.map((item) => {
              const isCollapsibleActive = item.items?.some((subItem) =>
                location.pathname.startsWith(subItem.url)
              );

              return item.items ? (
                <Collapsible
                  key={item.title}
                  asChild
                  className="group/collapsible"
                  defaultOpen={isCollapsibleActive}
                >
                  <SidebarMenuItem>
                    <CollapsibleTrigger asChild className="cursor-pointer">
                      <SidebarMenuButton tooltip={item.title}>
                        {item.icon && <item.icon />}
                        <span>{item.title}</span>
                        <Icons.chevronRight
                          className={cn(
                            "ml-auto transition-transform duration-200",
                            "group-data-[state=open]/collapsible:rotate-90"
                          )}
                        />
                      </SidebarMenuButton>
                    </CollapsibleTrigger>
                    <CollapsibleContent>
                      <SidebarMenuSub>
                        {item.items.map((subItem) => (
                          <SidebarMenuSubItem key={subItem.title}>
                            <SidebarMenuSubButton
                              asChild
                              className="text-white"
                            >
                              <NavLink
                                to={subItem.url}
                                className={({ isActive }) =>
                                  isActive ||
                                  location.pathname.startsWith(subItem.url)
                                    ? "active"
                                    : ""
                                }
                                end={false}
                              >
                                <span>{subItem.title}</span>
                              </NavLink>
                            </SidebarMenuSubButton>
                          </SidebarMenuSubItem>
                        ))}
                      </SidebarMenuSub>
                    </CollapsibleContent>
                  </SidebarMenuItem>
                </Collapsible>
              ) : (
                <SidebarMenuItem key={item.title}>
                  <SidebarMenuButton asChild>
                    <NavLink to={item.url} end>
                      <item.icon />
                      <span>{item.title}</span>
                    </NavLink>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              );
            })}
          </SidebarMenu>
        </SidebarGroupContent>
      </SidebarContent>
    </Sidebar>
  );
};

export default AppSidebar;
