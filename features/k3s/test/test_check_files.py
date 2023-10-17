from helper.utils import check_file
import pytest


@pytest.mark.parametrize(
    "file_name",
    [
        "/opt/local/bin/k3s"
    ]
)


def test_check_file(client, file_name):
    exists = check_file(client, file_name)
    assert exists, f"File {file_name} could not be found."
