import asyncio
import json
import websockets

async def handler(websocket, path):
    async for message in websocket:
        data = json.loads(message)
        print(f'Received: {data}')

        response = {'message': 'Hello, client!'}
        await websocket.send(json.dumps(response))

async def main():
    async with websockets.serve(handler, 'localhost', 8000):
        print('WebSocket server started')
        await asyncio.Future()

asyncio.run(main())
