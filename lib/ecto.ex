defmodule Repo do
  @moduledoc false

  use Ecto.Repo,
    otp_app: :http_api,
    adapter: Mongo.Ecto

end

defmodule User do

  use Ecto.Model
  import Ecto.Query

  @derive {Poison.Encoder, only: [:name, :age, :weight,:surname]}
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "user" do
    field :name
    field :surname, :integer
    field :age, :integer
    field :weight,    :float, default: 70.0
  end

  def main_query do
    from i in User,
      select: i
  end

  def find_by_name(name_id) do
    s = from i in User,
      limit: 1,
      where: i.name == ^name_id,
      select: i
    Repo.all(s)
  end

  def get_by_to_json(n) do
    s = from i in User,
      limit: 1,
      where: i.name == ^n,
      select: i
    a = Repo.all(s)
    {_,l} = Poison.encode(a)
    l
  end

  def all do
    Repo.all(main_query)
  end

  def all_to_json do
    {_,l} = Poison.encode(Repo.all(main_query))
    l
  end

end
