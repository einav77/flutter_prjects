import sqlite3 as sq
import datetime
conn = sq.connect('user.db')

def build_db():
    conn.execute('''CREATE TABLE IF NOT EXISTS user
    (
    username    TEXT PRIMARY KEY    NOT NULL,
    password    TEXT                NOT NULL,
    first_name  TEXT                NOT NULL,
    last_name   TEXT                NOT NULL,
    email       TEXT                NOT NULL,
    phone_num   TEXT                NOT NULL,
    user_ans    TEXT                NOT NULL
    );''')

def register(name, pas, first_name, last_name, email, phone , ans):
    params = (name, pas, first_name, last_name, email, phone, ans)
    if in_user(name):
        return "NO"
    else:
        print("roshem")
        conn.execute("INSERT INTO user \
            (username, password, first_name, last_name, email, phone_num, user_ans) \
                VALUES (?,?,?,?,?,?,?)", params)
        conn.commit()
    return "User Registered"

def in_user(name):
    cur = conn.execute('SELECT * FROM user')
    cu = cur.fetchall()
    for row in cu:
        if row[0] == name:
            return True
    return False

def has_login(name, pas):
    if not in_user(name):
        return False
    else:
        print('shit')
        cur = conn.execute('SELECT * FROM user')
        rows = cur.fetchall()
        for row in rows:
            print(row)
            if name == row[0]:
                if pas == row[1]:
                    return True
        return False
def update_ans(name, user_ans):
    cur = conn.execute("SELECT * FROM user WHERE username = ?", (name,))
    print('blaaa')
    row = cur.fetchone()
    if row:
        print("peola ovedet?")
        conn.execute('UPDATE user SET user_ans = ? WHERE username = ?', (user_ans, name))
        conn.commit()

def user_info(name):
    cur = conn.execute('SELECT*FROM user')
    cu = cur.fetchall()

    for row in cu:
        if row[0] == name:
            params = name + ","+row[0]+","+row[4]+","+row[5]+","+row[6]
    return params
def return_list_of_ans(name):
    cur = conn.execute('SELECT * FROM user')
    cu = cur.fetchall()
    for row in cu:
        if row[0] == name:
            listOfAns = row[6].split(',')
            listOfAns.remove(listOfAns[8])
            return listOfAns


def return_user_info(name):
    print("user info incoming")
    message = ''
    cur = conn.execute('SELECT * FROM user')
    cu = cur.fetchall()
    for row in cu:
        if str(row[0]) == name:
            for value in row:
                print(value)
                message = message + value +','
    return message


def tow_list_compare(list1 , list2):
    numOfSame = 0
    index = 0
    for i in list1:
        if(str(i) == list2[index]):
            numOfSame = numOfSame+1
        index = index +1
    return numOfSame

def newList (list , numNotgood , length):
    listToReturn = []
    for i in range(0 , length):
        if i!= numNotgood:
            listToReturn.append(list[i])
            print("working on it...")
    return listToReturn


def find_match(name):
    matchName = 'sorry couldent find'
    numOfSame = 0
    mostMatch = 0
    userAns = return_list_of_ans(name)
    print(name)


    cur = conn.execute('SELECT * FROM user')
    cu = cur.fetchall()

    for row in cu:
        otherUserAns = row[6].split(',')
        if str(row[0]) == str(name):
            print('')
        elif str(otherUserAns[0]) == " empty":
            print( "empty")
        else:
            numOfSame = tow_list_compare(userAns, otherUserAns)
        if numOfSame > mostMatch:
            mostMatch = numOfSame
            matchName = otherUserAns[1]

    return matchName

def send_to_client_match(list):
    toSend =''
    for value in list:
        toSend = toSend +value+","
    return toSend










