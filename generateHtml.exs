Mix.install([
  {:earmark, "~> 1.4"},
  {:json, "~> 1.4"}
 ])

 # const tree = [
 #   { name: ‘Create a dashboard’, content: ‘How to create a dashboard’ },
 #   {
 #     folder: ‘Getting Started’,
 #     sub: [{ name: ‘Getting Started’, content: ‘How to get started’ }]
 #   },
 #   {
 #     folder: ‘Groups’,
 #     sub: [
 #       { name: ‘Create a group’, content: ‘How to create a group’ },
 #       { name: ‘Something a group’, content: ‘How to something group’ }
 #     ]
 #   },
 #   {
 #     folder: ‘Dashboards’,
 #     sub: [
 #       { name: ‘Create a dashboard’, content: ‘How to create a dashboard’ },
 #       {
 #         name: ‘Something a dashboard’,
 #         content: ‘How to something dashboard’
 #       }
 #     ]
 #   }
 # ]

 defmodule GenerateHTML do
  def main do
    root = "./adi-docs/docs/adi"
    dest = "./generatedHtml.json"
    content = get_content(root)
    write_content(dest, content |> JSON.encode!)
    IO.inspect("JSON written to #{dest}")
  end

  def get_content(root) do
    File.cd!(root)

    File.ls!()
    |> Enum.filter(&File.dir?/1)
    |> Enum.map(fn dir_name ->
      %{
        "folder" => dir_name,
        "sub" =>
          File.ls!(dir_name)
          |> Enum.filter(fn file_name -> not File.dir?(Path.join(dir_name, file_name)) end)
          |> Enum.map(fn file_name ->
            {:ok, content, _} = File.read!(Path.join(dir_name, file_name)) |> Earmark.as_html
            %{
              "name" => title(file_name),
              "content" => content
            }
          end)
      }
    end)
  end

  def write_content(path, content) do
    File.write!(path, content, [:utf8])
  end

 def title name do
  Regex.replace(~r/\.md$/, String.replace(name, "_", " "), "")
 end

 end

 GenerateHTML.main
