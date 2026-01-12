import { describe, test } from "vitest";
import { render } from "@testing-library/react";
import Page from "../../../app/pages";

describe("</Page>", () => {
  test("renders without crashing", () => {
    render(<Page />);
  });
});
