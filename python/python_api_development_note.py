#python3.9.6
#VSCode
#    install python package

# create vitural environment 
# windows: py -3 -m venv <name>
# mac    : python3 -m venv <name>


# FastAPI
# pip install fastapi[all]

from email.mime import application
from typing import Optional
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}

# run api 
# uvicorn main:app
# uvicorn main:app --reload


@app.get("/posts")
def get_posts():
    return {"data":"This is your posts"}

# test http request postman

from fastapi.params import Body
@app.post("/createposts")
def create_posts(payloads: dict = Body(...)):
    print(payloads)
    return {"new_post": f"title {payloads['title']} content: {payloads['contents']}"}

# pydantic create schema
from pydantic import BaseModel

# title str, content str
class Post(BaseModel):
    title: str
    content: str
    published: bool = True
    rating: Optional[int] = None

@app.post("/createposts")
def create_posts(post: Post):
    print(post.title)
    print(post.content)
    print(post.published)
    print(post.rating)
    print(post.dict()) # convert model to dict.
    return {"data":"new post"}

# CRUD phrase of application
# Create
@app.post("/posts")
# Read
@app.get("/posts/{id}")
@app.get("/posts")
# Update
@app.put("/posts/{id}")
# Delete
@app.delete("/posts/{id}")

my_posts = [{"title":"title of post 1","content":"content of post 1","id":1},{"title":"favorite foods","content":"I like pizza","id":2}]

@app.get("/posts")
def get_posts():
    return {"data":my_posts}

from random import randrange 
@app.post("/posts")
def create_posts(post: Post):
    post_dict = post.dict()
    post_dict["id"] = randrange(0,10000000)
    my_posts.append(post_dict)
    return {"data":post_dict}

@app.get("/posts/{id}")
def get_post(id):
    print(id)
    return {"post_detail":f"Here is post {id}"}

def find_post(id):
    for p in my_posts:
        if p["id"] == id:
            return p
@app.get("/posts/{id}")
def get_post(id: int):
    post = find_post(id)
    return {"post_detail":post}

@app.get("/posts/latest")
def get_latest_post():
    post = my_posts[len(my_posts)-1]
    return {"post_detail":post}

# http status code


# time 1 hour 55 min 01 second