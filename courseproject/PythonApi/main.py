import requests
import asyncio

async def get_data(url: str):
    data = requests.get(url).json()
    return data

async def main():
   result = await get_data("https://catfact.ninja/fact")
   print(result['fact'])

asyncio.run(main())