from fastapi import APIRouter

router = APIRouter()


@router.get("/")
async def ping_pong() -> dict:
    status = {"ping": "pong"}
    return status
