<!--
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
-->

<link href="../assets/bootstrap.min.css" rel="stylesheet">
<script src="../assets/bootstrap.bundle.min.js"></script>
<script src="../assets/jquery-3.7.1.slim.min.js"></script>
<link rel="stylesheet" href="../assets/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style>
    #exerciseList 
    {
        max-height: 200px;
        overflow-y: auto;
        border: 1px solid #ccc;
        padding: 10px;
        border-radius: 5px;
    }
    .workout-container 
    {
        margin-bottom: 20px;
        border: 1px solid #ccc;
        padding: 15px;
        border-radius: 5px;
    }
    .exercise-name 
    {
        cursor: pointer;
        color: #007bff;
        text-decoration: underline;
    }
    .exercise-name:hover 
    {
        text-decoration: none;
    }
    .progress-table 
    {
        display: none;
        margin-top: 10px;
    }
    .progress-positive 
    {
        color: green;
        font-weight: bold;
    }
    .progress-negative 
    {
        color: red;
        font-weight: bold;
    }
    .progress-neutral 
    {
        color: gray;
        font-style: italic;
    }
    body 
    {
        font-family: Arial, sans-serif;
    }

    .half 
    {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;
    }

    .half.background 
    {
        background: url('https://images.unsplash.com/photo-1534438327276-14e5300c3a48?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z3ltfGVufDB8fDB8fHww') no-repeat center center/cover;
    }

    .half.text 
    {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background-color: #f4f4f4;
    }

    .half.text button 
    {
        margin: 10px;
        padding: 10px 20px;
        font-size: 16px;
        background-color: #007BFF;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .half.text p 
    {
        margin-bottom: 30px;
        font-size: 20px;
        color: #333;
        max-width: 80%;
    }

    .half.text button 
    {
        margin: 10px;
        padding: 10px 20px;
        font-size: 16px;
        background-color: #007BFF;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .half.text button:hover 
    {
        background-color: #0056b3;
    }
    strong
    {
        color:orange;
    }
</style>


