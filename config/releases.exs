import Config

name = "trainer2a"

config :libcluster,
  topologies: [
    nook_book: [
      strategy: Cluster.Strategy.Epmd,
      config: [
        hosts: [
          :"nook_book@10.0.1.207",
          :"nook_book@10.0.1.182"
        ]
      ]
    ]
  ]

config :nook_book, cluster_role: System.get_env("CLUSTER_ROLE", "member") |> String.to_atom()

config :nook_book, NookBookWeb.Endpoint,
  server: true,
  http: [port: 4000],
  url: [host: "#{name}.nookbook.online"],
  secret_keybase: "3IXO8jpmhBzRRxtOiCVBaCjsUAzQeg/3U83QUBiakA5NiiIxrUUr1F99YsPZkSzE"
