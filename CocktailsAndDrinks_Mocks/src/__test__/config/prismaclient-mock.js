const { PrismaClient } = require('@prisma/client');
const { mockDeep, DeepMockProxy } = require('jest-mock-extended');

const Context = {
    prisma: PrismaClient
}

const MockContext = {
   //prisma: DeepMockProxy<PrismaClient>
    prisma: DeepMockProxy
}

//mockDeep<PrismaClient>
const createMockContext = () => mockDeep;

module.exports = {
    Context,
    MockContext,
    createMockContext
}