Sub StockAnalysis()
        Dim ws As Worksheet
             For Each ws In Worksheets
        ws.Activate

        ws.Range("I1").Value = "Ticker"
        ws.Range("J1").Value = "Total Stock Volume"


        Dim Ticker As String

        Dim totalvolume As Double
            totalvolume = 0

        Dim summarytablerow As Integer
            summarytablerow = 2
        
        
        LastRow = ws.Cells(Rows.Count, 1).End(xlUp).Row
        
            For i = 2 To LastRow

                If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then


                    Ticker = Cells(i, 1).Value

                    totalvolume = totalvolume + Cells(i, 7).Value


                    
                    ws.Range("I" & summarytablerow).Value = Ticker


                    ws.Range("J" & summarytablerow).Value = totalvolume

                 
                   summarytablerow = summarytablerow + 1
                    
                    
                    totalvolume = 0


                Else


                  
                    totalvolume = totalvolume + Cells(i, 7).Value


                End If
                  
            Next i


        Next ws


    End Sub