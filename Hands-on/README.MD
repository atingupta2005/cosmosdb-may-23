## Getting started

- Install the latest [Visual Studio Code](https://code.visualstudio.com/).

- Install the latest [.NET 6 SDK](https://dotnet.microsoft.com/download/dotnet/6.0)
- Install [.NET 3.1 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/3.1) (used by cosmicworks command-line tool)

- Install the .NET Interactive Notebooks extension from the [marketplace](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.dotnet-interactive-vscode).

- Azure CLI and Azure PowerShell

```bash
sudo apt-get update
sudo apt-get install azure-cli
sudo apt-get install powershell
pwsh
Install-Module -Name Az -AllowClobber -Scope CurrentUser
```

- Install the cosmicworks command-line tool for global use on your machine.

```bash
dotnet tool install --global cosmicworks
```

## Setup for demo's

```bash
az login
az account set --subscription "<subscriptionid>"
az group create --name rg-dp-420 --location westeurope

az cosmosdb create --name cosmos-dp-420-sql-provisioned --resource-group rg-dp-420
az cosmosdb create --name cosmos-dp-420-sql-serverless --resource-group rg-dp-420

COSMOS_DB_PROVISIONED_CONNECTION_STRING=$(az cosmosdb keys list --name cosmos-dp-420-sql-provisioned --resource-group rg-dp-420 --type connection-strings --query "connectionStrings[?description=='Primary SQL Connection String'].connectionString" --output tsv)

COSMOS_DB_SERVERLESS_CONNECTION_STRING=$(az cosmosdb keys list --name cosmos-dp-420-sql-serverless --resource-group rg-dp-420 --type connection-strings --query "connectionStrings[?description=='Primary SQL Connection String'].connectionString" --output tsv)
```

(in the notebooks we can get this through a powershell cell and share the result in a C# cell)

```pwsh
Connect-AzAccount
Set-AzContext -Subscription "b895a719-7034-411a-9944-ff196d1f450f"

$cosmosDBConnectionString = (Get-AzCosmosDBAccountKey -ResourceGroupName rg-dp-420 -Name cosmos-dp-420-sql-provisioned -Type "ConnectionStrings")["Primary SQL Connection String"]
````

```csharp
#!share --from pwsh cosmosDBConnectionString
Console.WriteLine(cosmosDBConnectionString)
```

