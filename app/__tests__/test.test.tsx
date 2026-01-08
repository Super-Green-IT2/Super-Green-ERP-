import { render } from "@testing-library/react";
import { describe, test } from "vitest";
import Test from "../pages/test";

describe("sample test", () => {
    test("true is true", () => {
        render(<Test/>)
    })
})