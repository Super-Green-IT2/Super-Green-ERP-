import { describe,test } from "vitest";
import {render} from "@testing-library/react";
import Page from "../pages";

describe("</Page>", ()=>{
  test("renders without crashing", () => {
    render(<Page />);
  });
})