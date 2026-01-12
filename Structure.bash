super-green-erp/
│
├── apps/
│   ├── web/                    # Next.js frontend
│   │   ├── app/                # App Router
│   │   ├── components/
│   │   ├── features/           # Feature-based UI
│   │   │   ├── auth/
│   │   │   ├── branches/
│   │   │   ├── commissions/
│   │   │   └── dashboard/
│   │   ├── hooks/
│   │   ├── lib/
│   │   ├── styles/
│   │   ├── tests/
│   │   ├── vitest.config.ts
│   │   ├── Dockerfile
│   │   └── package.json
│   │
│   └── api/                    # Backend (Next API / Node service)
│       ├── src/
│       │   ├── modules/        # Feature-based backend
│       │   │   ├── auth/
│       │   │   ├── branches/
│       │   │   ├── commissions/
│       │   │   ├── users/
│       │   │   └── clients/
│       │   ├── routes/
│       │   ├── services/
│       │   ├── db/
│       │   │   ├── prisma/
│       │   │   └── migrations/
│       │   ├── utils/
│       │   ├── tests/
│       │   └── index.ts
│       │
│       ├── vitest.config.ts
│       ├── Dockerfile
│       └── package.json
│
├── packages/
│   ├── shared/                 # Shared logic (types, utils)
│   │   ├── types/
│   │   ├── constants/
│   │   └── validators/
│   │
│   └── config/                 # Shared configs
│       ├── eslint/
│       ├── tsconfig/
│       └── vitest/
│
├── infra/
│   ├── docker/
│   │   ├── docker-compose.yml
│   │   ├── postgres/
│   │   └── redis/
│   │
│   └── nginx/
│       └── nginx.conf
│
├── .github/
│   └── workflows/
│       ├── ci.yml
│       └── deploy.yml
│
├── .env.example
├── turbo.json / pnpm-workspace.yaml
├── package.json
└── README.md


// This is your Prisma schema file,
// learn more about it in the docs: https://pris.ly/d/prisma-schema

// Looking for ways to speed up your queries, or scale easily with your serverless or edge functions?
// Try Prisma Accelerate: https://pris.ly/cli/accelerate-init

generator client {
  provider = "prisma-client"
  output   = "../app/generated/prisma"
}

datasource db {
  provider   = "postgresql"
  
}


model Branch {
  id        String   @id @default(uuid())
  name      String
  location  String
  members   Member[]
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
}

model Position {
  id        String   @id @default(uuid())
  title     String
  baseSalary Float
  commissionRate CommissionRate?
  members   Member[]
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
}

model CommissionRate {
  id          String   @id @default(uuid())
  rate        Float
  position    Position @relation(fields: [positionId], references: [id])
  positionId  String   @unique
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
}

//many side ekata foreign key eka / Parent has an array
model Member {
  id              String   @id @default(uuid())
  name            String
  email           String   @unique
  phone           String
  totalCommission Float    @default(0)

  branchId  String
  branch    Branch   @relation(fields: [branchId], references: [id])

  positionId String
  position   Position @relation(fields: [positionId], references: [id])

  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
}
