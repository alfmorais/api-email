import pytest


@pytest.mark.vcr
def test_initial():
    foo = "foo"
    bar = "bar"
    foobar = foo + "-" + bar

    assert foo == "foo"
    assert bar == "bar"
    assert foobar == "foo-bar"
