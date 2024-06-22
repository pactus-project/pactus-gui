# **ProtoBuf Definitions**

### ● **BlockChain Service Definition**

```
+-------------+---------------------------+----------------------------------+-------------------------------+
|   SERVICE   |            RPC            |           REQUEST TYPE           |         RESPONSE TYPE         |
+-------------+---------------------------+----------------------------------+-------------------------------+
| Blockchain  | GetBlock                  | GetBlockRequest                  | GetBlockResponse              |
| Blockchain  | GetBlockHash              | GetBlockHashRequest              | GetBlockHashResponse          |
| Blockchain  | GetBlockHeight            | GetBlockHeightRequest            | GetBlockHeightResponse        |
| Blockchain  | GetBlockchainInfo         | GetBlockchainInfoRequest         | GetBlockchainInfoResponse     |
| Blockchain  | GetConsensusInfo          | GetConsensusInfoRequest          | GetConsensusInfoResponse      |
| Blockchain  | GetAccount                | GetAccountRequest                | GetAccountResponse            |
| Blockchain  | GetValidator              | GetValidatorRequest              | GetValidatorResponse          |
| Blockchain  | GetValidatorByNumber      | GetValidatorByNumberRequest      | GetValidatorResponse          |
| Blockchain  | GetValidatorAddresses     | GetValidatorAddressesRequest     | GetValidatorAddressesResponse |
| Blockchain  | GetPublicKey              | GetPublicKeyRequest              | GetPublicKeyResponse          |
+-------------+---------------------------+----------------------------------+-------------------------------+
```

### ● **Transaction Service Definition**

```
+-------------+---------------------------+----------------------------------+-------------------------------+
|   SERVICE   |            RPC            |           REQUEST TYPE           |         RESPONSE TYPE         |
+-------------+---------------------------+----------------------------------+-------------------------------+
| Transaction | GetTransaction            | GetTransactionRequest            | GetTransactionResponse        |
| Transaction | CalculateFee              | CalculateFeeRequest              | CalculateFeeResponse          |
| Transaction | BroadcastTransaction      | BroadcastTransactionRequest      | BroadcastTransactionResponse  |
| Transaction | GetRawTransferTransaction | GetRawTransferTransactionRequest | GetRawTransactionResponse     |
| Transaction | GetRawBondTransaction     | GetRawBondTransactionRequest     | GetRawTransactionResponse     |
| Transaction | GetRawUnbondTransaction   | GetRawUnbondTransactionRequest   | GetRawTransactionResponse     |
| Transaction | GetRawWithdrawTransaction | GetRawWithdrawTransactionRequest | GetRawTransactionResponse     |
+-------------+---------------------------+----------------------------------+-------------------------------+
```

### ● **Wallet Service Definition**

```
+-------------+---------------------------+----------------------------------+------------------------------+
|   SERVICE   |            RPC            |           REQUEST TYPE           |        RESPONSE TYPE         |
+-------------+---------------------------+----------------------------------+------------------------------+
| Wallet      | GetTotalBalance           | GetTotalBalanceRequest           | GetTotalBalanceResponse      |
| Wallet      | GetAddressHistory         | GetAddressHistoryRequest         | GetAddressHistoryResponse    |
| Wallet      | GetNewAddress             | GetNewAddressRequest             | GetNewAddressResponse        |
| Wallet      | GetValidatorAddress       | GetValidatorAddressRequest       | GetValidatorAddressResponse  |
| Wallet      | SignRawTransaction        | SignRawTransactionRequest        | SignRawTransactionResponse   |
| Wallet      | CreateWallet              | CreateWalletRequest              | CreateWalletResponse         |
| Wallet      | UnloadWallet              | UnloadWalletRequest              | UnloadWalletResponse         |
| Wallet      | LoadWallet                | LoadWalletRequest                | LoadWalletResponse           |
| Wallet      | RestoreWallet             | RestoreWalletRequest             | RestoreWalletResponse        |
+-------------+---------------------------+----------------------------------+------------------------------+
```

### ● **Network Service Definition**

```
+---------+----------------+-----------------------+------------------------+
| SERVICE |      RPC       |     REQUEST TYPE      |     RESPONSE TYPE      |
+---------+----------------+-----------------------+------------------------+
| Network | GetNetworkInfo | GetNetworkInfoRequest | GetNetworkInfoResponse |
| Network | GetNodeInfo    | GetNodeInfoRequest    | GetNodeInfoResponse    |
+---------+----------------+-----------------------+------------------------+
```