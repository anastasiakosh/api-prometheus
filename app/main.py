from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="Toolkit API")

class Item(BaseModel):
	name: str
	price: float

@app.get("/health")
astnc def health_check():
	return {"status": "healthy"}

@app.post("/items/")
aync def create_item(item: Item):
	return {"message": f"Item {item.name} created", "data": item}
