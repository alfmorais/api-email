import pytest
from emailapi.server import get_application
from httpx import AsyncClient


@pytest.mark.anyio
async def test_routes_ping_pong_temporary_redirect():
    async with AsyncClient(
        app=get_application(), base_url="http://test"
    ) as client:  # noqa E501
        response = await client.get("/api/v1")

    assert response.status_code == 307


@pytest.mark.anyio
async def test_routes_ping_pong_sucess():
    async with AsyncClient(
        app=get_application(), base_url="http://test"
    ) as client:  # noqa E501
        response = await client.get("/api/v1/")

    assert response.status_code == 200
    assert response.json() == {"ping": "pong"}
