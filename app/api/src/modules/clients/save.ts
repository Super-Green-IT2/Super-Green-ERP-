import { prisma } from "../../utils/prisma";

export const saveClient = async (data: { name: string; email: string;}) => {
    const res = await prisma.client.create({
        data: {
            name: data.name,
            email: data.email,
        },
    });
    return res;
}