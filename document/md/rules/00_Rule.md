# レギュレーション

「本番稼働開始済みの業務アプリケーション」に対するパフォーマンス改善を行うことが原則です。

以下の行為は減点、0 点、あるいは失格の対象となる場合があります。

- 原則を大きく逸脱した、極端な最適化を行うこと
  - API 動作テストは PASS するが、業務アプリとして実質使えなくなるような最適化は NG です。
  - 微妙なラインの場合は、審議する場合があります。
- 初期データ (顧客データ)を欠損させる最適化
  - データを消して高速化するなど。顧客データは API を通して引き続き利用できなければいけません。
  - ただし画像については、UI 上十分機能する場合に限り、変換や圧縮を認めます。
  - 既存テーブルとカラムの名前変更・削除は行わないでください。
  - 改善の過程で、検証のためにデータを変更したり削除してみる行為は問題ありません。
- UI が明らかに変わるような仕様変更
- 以下の[環境の制約事項](#環境の制約事項)を利用する最適化
- 採点中に提供された環境以外のリソースを利用し、処理能力を上げること (例: 個人 PC でリクエスト処理を代替する)
- 採点モジュールの改ざん、または不具合を悪用し不当にスコアを上げること
- 他チームの環境にログインし、コードを変更したり DOS 攻撃等の妨害行為を行うこと
- 他チームと結託すること。他チームの環境にログインする、リポジトリを見るなどのカンニング行為
- その他、主催者側が不適切と判断した行為

「これは OK?」と思った時は、[FAQ](./01_FAQ.md)を参照するか、運営に問い合わせてください。

### 競技中及び競技環境に関する注意

- 競技環境の HDD の容量はそこまで潤沢ではありません。不要なリソースは削除するようにしてください。
- リポジトリのディレクトリ構成を変えないようにしてください。スクリプトが動作しなくなる場合があります。
- `/.da`領域は変更しないでください。動作しなくなる場合があります。また、中身の持ち出しも禁止です。
- OS をシャットダウンした場合、参加者は SSH ログインできなくなります。ドリーム・アーツ社員でないと復旧できないため時間をロスすることになります。
- Azure 障害により競技環境が一時的に使用できなくなった場合でも、課題提出締め切りの延長はありません。
- OS を書き換える等により競技環境が破損し環境再構築が発生した場合も、課題提出締め切りの延長はありません。
- テスト用のセッションが mysql の session テーブルに登録されており、`session_id`が`test-session-id`、`linked_user_id`が`test-user-id`となっています。
- このレコードを削除すると負荷試験が失敗するため、誤って消してしまった場合はリストアを試すか、session テーブルに再度レコードを登録してください。

### 環境の制約事項

競技主催者側の都合上、やむを得ず現実的なシナリオと乖離している箇所があります。これを利用しても業務アプリケーションの改善とは言い難いため、あらかじめ共有します。

- 初期データに含まれる添付ファイルは同じ内容を使い回している
  - HDD 容量制限のため
  - 同じファイルが参照されることがありますが、基本的には別の添付ファイルとして扱ってください
- API テストは、一部のテスト用のユーザ情報を利用して実施される
  - ユーザの識別はアクセス状況から容易にわかりますが、この情報を使って API テストだけ PASS する最適化はレギュレーション違反とします