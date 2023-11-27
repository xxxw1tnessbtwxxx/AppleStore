import asyncio

async def printNumbers():
    for i in range(1, 100):
        print(i)

async def main():
    asyncio.run(printNumbers())
    for i in range(1, 100):
        print("Hello World")


asyncio.run(main())