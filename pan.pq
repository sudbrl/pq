(
    pan as text
) as text =>
let
    // Fetch the webpage content using the provided PAN
    Source = Web.BrowserContents("https://sushilparajuli.com/api/pan.php?pan=" & pan),

    // Attempt to parse the HTML table from the content
    ExtractedTable = try Html.Table(Source, {{"Column1", "BODY"}}) otherwise null,

    // Check if the extraction was successful and if there's any data
    Column1 = if ExtractedTable <> null and Table.RowCount(ExtractedTable) > 0
              then ExtractedTable[Column1]{0}
              else "No data found"
in
    Column1
