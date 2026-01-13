import { env } from "process";
import Test from "./pages/test/page";

export default function Home() {
  console.log(env.DIRECT_URL);
  
  return (
    <div>
      Welcome to Super Green ERP!
      <Test />
    </div>
  );
}
