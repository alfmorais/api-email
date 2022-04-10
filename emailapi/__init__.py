from fastapi import APIRouter

from .routes import router as standard_router

router = APIRouter()

router.include_router(
    standard_router, prefix="/ping_status", tags=["ping_status"]
)  # noqa E501
