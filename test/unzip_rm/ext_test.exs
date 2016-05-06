defmodule UnzipRm.ExtTest do
  use ExUnit.Case

  test "filters out the names with the given extension" do
    assert UnzipRm.Ext.filter_with_ext(["test.zip", "test.jpg"], "zip") == ["test.zip"]
  end

  test "no matches returns an empty array" do
    assert UnzipRm.Ext.filter_with_ext(["test.jpg"], "zip") == []
  end
end
