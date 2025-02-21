from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class Item(BaseModel):
    key: str
    value: str


my_dict = {}

@app.get("/")
async def root():
    return {"owner": "SEBASTIAN BOLAÑOS"}

@app.post("/add/")
async def add_item(item: Item):
    my_dict[item.key] = item.value
    return {"status": "Item added successfully"}

@app.get("/get/{key}/")
async def get_item(key: str):
    value = my_dict.get(key, "Key not found")
    return {"key": key, "value": value}
