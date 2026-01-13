import { NextRequest, NextResponse } from "next/server";
import { prisma } from "../utils/prisma";

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { name, email } = body;

    const client = await prisma.client.create({
      data: { name, email },
    });

    return NextResponse.json(client, { status: 201 });
  } catch (error) {
    console.error(error);
    return NextResponse.json(
      { error: "Failed to save client" },
      { status: 500 }
    );
  }
}
