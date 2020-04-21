# レスポンスの確認

GET, POST, PUT, PATCH, DELETEなどのHTTPレスポンスをWiresharkを用いて確認する

## 前提

- Dockerがインストール済みであること
- Wiresharkがインストール済みであること

## 想定図
![System diagram](https://user-images.githubusercontent.com/37664176/73596611-e5a50780-4566-11ea-8fc3-7ff75e492673.png)

## 準備

```bash
# Build
$ docker-compose build

# Run
# You can access http://localhost and https://localhost:3001
$ docker-compose up -d
```

## 実行

### Wireshark側の操作

- `LoopBack: lo:0` を選択

<img width="960" alt="スクリーンショット 2020-04-21 20 18 14" src="https://user-images.githubusercontent.com/37664176/79860246-46790900-840d-11ea-8429-05551ffc3936.png">

### Docker側の操作

- コンテナの起動

```bash
# コンテナを起動していなかった場合
$ docker-compose ps
Name   Command   State   Ports
------------------------------

# コンテナを起動をする
$ docker-compose up -d 
Creating network "confirm-rest-api_default" with the default driver
Creating rest_api_db ... done
Creating rest_api_web ... done
Creating rest_api_ssl_web ... done

# コンテナの起動を確認
$ docker-compose ps
      Name                    Command               State           Ports         
----------------------------------------------------------------------------------
rest_api_db        docker-entrypoint.sh postgres    Up      0.0.0.0:5432->5432/tcp
rest_api_ssl_web   ash -c /confirm_rest_api/o ...   Up      0.0.0.0:3000->3000/tcp
rest_api_web       ash -c /confirm_rest_api/o ...   Up      0.0.0.0:81->81/tcp 
```

- 各URLへアクセスする

`http://localhost:81/users/new`
`https://localost:3001/users/new`

**Create new account** をクリックしPOSTを行う
