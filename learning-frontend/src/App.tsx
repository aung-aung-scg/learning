import { createBrowserRouter, RouterProvider } from "react-router-dom";
import Main from "./layouts/admin/Main";
import Error from "./pages/Error";
import {
  Dashboard,
  GroupList,
  Report,
  RoleList,
  SubjectList,
  UserList,
} from "./pages/admin";

function App() {
  const router = createBrowserRouter([
    {
      path: "/admin",
      element: <Main />,
      errorElement: <Error />,
      children: [
        { index: true, element: <Dashboard /> },
        { path: "/admin/dashboard", element: <Dashboard /> },
        { path: "/admin/reports", element: <Report /> },
        { path: "/admin/subjects", element: <SubjectList /> },
        { path: "/admin/users", element: <UserList /> },
        { path: "/admin/roles", element: <RoleList /> },
        { path: "/admin/groups", element: <GroupList /> },
      ],
    },
  ]);

  return (
    <div>
      <RouterProvider router={router} />
    </div>
  );
}

export default App;
