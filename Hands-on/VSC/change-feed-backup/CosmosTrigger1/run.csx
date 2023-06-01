#r "Microsoft.Azure.DocumentDB.Core"
using System;
using System.Collections.Generic;
using Microsoft.Azure.Documents;

public static void Run(out String outputBlob, IReadOnlyList<Document> input, ILogger log)
{
    
    if (input != null && input.Count > 0)
    {
        outputBlob = "[";
        foreach (var document in input)
        {
            outputBlob = outputBlob + document.ToString() + ","; 
        }
        outputBlob = outputBlob.Remove(outputBlob.Length - 1, 1);
        outputBlob = outputBlob + "]";
    }
    else
    {
        outputBlob = "";
    }
}
