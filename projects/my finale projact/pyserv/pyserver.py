import socket
import asyncio
import websockets
import db
import threading

db.build_db()
async def handle_client(websocket):
    x = threading.Thread(target=db.connect)
    x.start()
    try:
        async for message in websocket:
            print(f"Message received: {message}")
            data = message.split(',')
            print(data)
            if data[0] == "logup":
                db.register(data[1],data[4],data[2],data[3],data[6],data[5], data[7])
            elif data[0] == "find":
                nameOfMatch = db.find_match(data[1])
                if(nameOfMatch == "sorry couldent find"):
                    listToClient = ['sorry','but','we','able', 'to found']
                    await websocket.send("match"+","+listToClient)
                else:
                    sendToClient = db.return_user_info(nameOfMatch)
                listOfInfo = sendToClient.split(',')
                newListOfInfo = db.newList(listOfInfo, 1, 6)
                toClient = db.send_to_client_match(newListOfInfo)
                print(toClient)
                await websocket.send("match"+","+toClient)

            elif data[0] == "login":
                answer = db.has_login(data[1], data[2])
                if answer == True:
                    await websocket.send("true"+","+db.user_info(data[1]))
            elif data[0] == "updateans":
                print("updateeee")
                user_ans = ''
                for i in data:
                    user_ans = user_ans+i+','
                    print(str(user_ans))
                print(data[1] + 'this is the data')
                user_ans = str(user_ans)
                db.update_ans(data[1], user_ans)
    except: print("error")

async def main():
    print("Server Start")
    hostname = socket.gethostname()
    ip_address = socket.gethostbyname(hostname)
    async with websockets.serve(handle_client, ip_address, 8820):
        await asyncio.Future()  # Run forever


if __name__ == "__main__":
    asyncio.run(main())
