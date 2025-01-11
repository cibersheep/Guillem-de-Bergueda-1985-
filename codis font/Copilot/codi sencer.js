// Initialization and setup
try {
    // Equivalent of POKE &BDEE,201:ON ERROR GOTO 5280
    // JavaScript does not have direct memory access, but we handle errors using try-catch
    throw new Error("Initialization Error");
} catch (error) {
    console.error("** ERROR   EXTERN **");
    console.error("DESCONECTAR         PERIFERIC");
    // Equivalent of FOR A=0 TO 800:NEXT:CALL 0
    for (let A = 0; A <= 800; A++) {}
    process.exit(0); // Exit the program
}

console.log("Guillem de Bergueda en versio CPC6128 de AMSTRAD € FEDERICO J. ALONSO PADILLA & ACE & GENERALITAT DE CATALUNYA");

// Screen setup and initial settings
let pen = 1;
let paper = 0;
let ink = [0, 24, 1, 0];
let border = 13;
let clear = true;
let speedKey = [14, 5];

// Drawing setup
function draw() {
    pen = 1;
    move(342, 15);
    drawLine(342, 384);
    move(1, 0);
    drawLine(343, 15);
    drawLine(633, 15);
    drawLine(633, 384);
    move(-1, 0);
    drawLine(632, 15);
    move(342, 384);
    drawLine(633, 384);
    paper = 1;
    pen = 0;
    window(0, 44, 79, 2, 24);
    clearScreen();
    locate(1, 1);
    ink = [1, 0, 0, 2];
}

function move(x, y) {
    console.log(`Move to (${x}, ${y})`);
}

function drawLine(x, y) {
    console.log(`Draw line to (${x}, ${y})`);
}

function window(id, x1, y1, x2, y2) {
    console.log(`Set window ${id} from (${x1}, ${y1}) to (${x2}, ${y2})`);
}

function clearScreen() {
    console.log("Clear screen");
}

function locate(x, y) {
    console.log(`Locate cursor at (${x}, ${y})`);
}

draw();

// Key setup
let keys = [];
for (let j = 0; j <= 9; j++) {
    keys[j] = "";
}

let mu = 0;
let mo = 0;
let xx = 1;
window(2, 1, 1, 1, 1);

console.log("Initial setup completed");







// Variables initialization
let mu = 0;
let mo = 0;
let xx = 1;
let mar = 0; // Assuming mar is defined somewhere else
let fa = 0;  // Assuming fa is defined somewhere else

// Initial setup
function windowSetup() {
    console.log("Setting up window #2,1,1,1,1");
    // Implement window setup logic here
}

windowSetup();

// Adopted another presentation, cancellation of the previous one
console.log("Adopted another presentation, cancellation of the previous one");

// End of title
if (mar === 1) {
    fa = 1;
}







// Game Initialization
function initializeGame() {
    clearScreen();
    let d = 0;
    let ni = 1;

    // Initialize arrays
    let l1 = new Array(100).fill("");
    let pa = new Array(40).fill("");
    let co = new Array(40).fill("");
    let si = new Array(40).fill(0);

    // Randomize the starting position
    let x = Math.floor(Math.random() * 82) + 11;

    // Ensure x is not in the excluded list
    const excluded = [20, 30, 39, 40, 48, 49, 50, 57, 58, 59, 60, 66, 67, 68, 69, 70, 75, 76, 77, 78, 79, 80, 84, 85];
    while (excluded.includes(x)) {
        x = Math.floor(Math.random() * 82) + 11;
    }

    // Calculate coordinates based on x
    let xp, yp, st;
    if (x > 7) {
        xp = (10 * (x / 10 - Math.floor(x / 10)) - 1) * 32 + 9;
        yp = Math.floor(x / 10) * -26 + 304;
        st = 29;
    } else {
        xp = 9;
        yp = 304;
        st = 316;
    }

    // Initialize data
    let i1 = Math.floor(Math.random() * 33) + 1;
    let i2 = 33 - i1;
    let cx, w;
    for (let j = 1; j <= i1; j++) {
        // Read cx% (in BASIC, this would be a DATA statement)
        cx = readData();
    }
    for (let j = 1; j <= i2; j++) {
        // Read w (in BASIC, this would be a DATA statement)
        w = readData();
    }

    // Function to simulate reading from DATA statements
    function readData() {
        const data = [14, 16, 17, 18, 19, 22, 24, 26, 27, 28, 29, 31, 34, 35, 37, 41, 42, 45, 46, 47, 52, 53, 56, 62, 63, 64, 71, 72, 73, 74, 81, 91, 92];
        return data[Math.floor(Math.random() * data.length)];
    }

    // Determine value of w based on conditions
    if (Math.floor(cx / 10) < 10 * (cx / 10 - Math.floor(cx / 10))) {
        w = 1;
    } else {
        w = 10;
    }
    console.log("Game initialized");
}

function clearScreen() {
    console.log("Clear screen");
}

initializeGame();







// Function to simulate reading user input
function getUserInput(promptMessage) {
    let input = prompt(promptMessage);
    return input ? input.toUpperCase() : "";
}

// Function to handle the user interaction
function userInteraction() {
    let n = ""; // User's name
    while (true) {
        console.log("HOLA! COM ET DIUS ?");
        console.log("(Nom i Cognoms)");
        n = getUserInput("> ");
        if (n === "") {
            n = "Psssstt ... ";
            console.log(`Si no tens nom et diré:- ${n}`);
            for (let yu = 0; yu <= 3000; yu++) {} // Delay loop
        }
        if (n.length > 25) {
            console.log("El teu nom és molt llarg. Dóna-me'l més curt.");
            continue;
        }
        break;
    }

    console.log("Cerca el cofre meravellós.");
    console.log("També pots utilitzar el teclat numèric per escriure automàticament els missatges indicats:");
    console.log("f7 agafo   f8 pujo      f9 deixo");
    console.log("f4 farcell f5 vaig nord f6 ajuda");
    console.log("f1 vaig est f2 vaig sud f3 vaig oest");
    console.log("Pots treure i posar la música amb ~treu musica~ i ~musica~.");
    console.log("Per continuar pren una tecla.");

    // Wait for a key press
    document.addEventListener("keydown", function onKeyPress(event) {
        document.removeEventListener("keydown", onKeyPress);
        gameNextStep();
    });
}

// Function to continue the game after user interaction
function gameNextStep() {
    clearScreen();
    // Further game logic here
    console.log("Game continues...");
}

// Function to clear the console (simulating CLEAR and CLS in BASIC)Game Logic
function clearScreen() {
    console.clear();
}

// Initialize user interaction
userInteraction();





// Initialize game variables
let d = 0;
let ni = 1;
let din = 100; // Assuming initial value
let mar = 0; // Assuming initial value
let so = 0; // Assuming initial value
let cx, xp, yp, st, ga, ba, pb;
let si = new Array(40).fill(0);
let l1 = new Array(100).fill("");
let pa = new Array(40).fill("");
let co = new Array(40).fill("");
let cl = new Array(3).fill("");
let tm = "";

// Function to clear the screen
function clearScreen() {
    console.clear();
}

// Function to get user input
function getUserInput(promptMessage) {
    let input = prompt(promptMessage);
    return input ? input.toUpperCase() : "";
}

// Main game loop
function gameLoop() {
    d = 0; ni = 1;

    // Randomize initial position
    let x = Math.floor(Math.random() * 82) + 11;
    while ([20, 30, 39, 40, 48, 49, 50, 57, 58, 59, 60, 66, 67, 68, 69, 70, 75, 76, 77, 78, 79, 80, 84, 85].includes(x)) {
        x = Math.floor(Math.random() * 82) + 11;
    }

    // Setup coordinates and state based on x
    if (x > 7) {
        xp = (10 * (x / 10 - Math.floor(x / 10)) - 1) * 32 + 9;
        yp = Math.floor(x / 10) * -26 + 304;
        st = 29;
    } else {
        xp = 9;
        yp = 304;
        st = 316;
    }

    // Game loop
    while (true) {
        clearScreen();
        d += 1;
        let d1 = 0;

        // Example of reading data and updating state
        si[6] = 15; si[5] = 76;

        console.log("************************************");
        console.log(`${n$}: Dia ${d}`);

        // Additional game logic here...

        // Check user input
        let userInput = getUserInput("QUE FAS ...?");
        if (userInput.includes("AJUDA")) {
            // Handle "ajuda" command
        } else if (userInput.includes("MUSICA")) {
            // Handle "musica" command
        }

        // Process other commands
        let g1 = 0, g2 = 0;
        for (let j = 0; j < 40; j++) {
            if (userInput.endsWith(pa[j].slice(-4))) g2 = j;
            if (userInput.startsWith(pa[j].slice(0, 4))) g1 = j;
        }

        // Additional command handling logic...

        if (g1 === 11 && g2 === 11) {
            console.log("ESTAS PORTANT :");
            tm = din ? "Diners," : "";
            for (let j = 5; j < 40; j++) {
                if (si[j] === -1) tm += `${pa[j].slice(7)},`;
            }
            if (mar === 1) tm += "Títol Barca,";
            console.log(tm ? `${tm}.` : "res.");
        }

        // Example of handling "deixo" command
        if (g1 === 10) {
            if (g2 === 20 || g2 === 19) {
                console.log("Quin pes t'has tret !");
                din += 50;
                for (let j = 5; j < 40; j++) {
                    if (si[g2] === -1) {
                        si[g2] = x;
                        break;
                    }
                }
            } else {
                console.log(`No portes cap ${userInput.slice(e)}`);
            }
        }

        // Example of handling "compro" command
        if (g1 === 31) {
            if (din < 25) {
                console.log("No tens prou diners !");
            } else {
                if (g2 === 19) {
                    console.log("Es teva !");
                    din = 0;
                    mar = 1;
                    co[19] = co[19].slice(0, 30);
                    si[19] = 29;
                } else if (g2 === 20) {
                    console.log("Es teu !");
                    din = 0;
                    mar = 1;
                    co[20] = co[20].slice(0, 30);
                    si[20] = 74;
                } else {
                    console.log(`No hi cap ${userInput.slice(e)}`);
                }
            }
        }

        // Additional game logic and state updates...

        // End of loop, check if game continues
        if (/* some condition to end the game */) {
            break;
        }
    }
}

// Start the game loop
gameLoop();









function handleEventsAndResponses(g1, g2, x, si, co, cl, so, din) {
  // Event: Roca
  if (g1 === 12 && g2 === 8 && x === 3) {
    console.log('La inscripció posa:');
    console.log('"La vall que veus allà baix, va cap al nord."');
  }

  // Event: Encountering a Moro
  if (x === 95) {
    console.log(`Et trobes un moro que et diu: "${cl[2]}"`);
    so += 1;
  }

  // Event: Encountering a Morisc
  if (x === 85) {
    console.log('Un morisc et canta a l\'orella:');
    console.log(` - ~està prop de ${l1[cx - 1 * w].substring(9)}~ -`);
    so += 1;
  }

  // Event: Specific conditions for g1 and g2
  if (g1 === 17 && g2 === 32 && x === 40) {
    if (si[18] === -1 || si[17] === -1) {
      console.log(`que abans de morir et diu agonitzant "${cl[1]}"`);
      so += 1;
      si[32] = 0;
    }
  }

  // Event: Notari
  if (g1 === 3 && g2 === 23 && x === 68 && si[7] <= 1) {
    console.log(`I el notari et diu: "${cl[1]}"`);
    so += 1;
  }
}

// Call the function with appropriate arguments
handleEventsAndResponses(g1, g2, x, si, co, cl, so, din);






function handleLocationsAndEvents(g1, g2, x, si, cl, so, mar, co) {
  if (g1 === 34 && g2 === 30 && x === 16) {
    console.log(`I l'Arondeta et contesta dient suaument: "${cl[2]}"`);
    so += 1;
  }

  if (g1 === 33 && g2 === 29 && x === 27 && si[7] <= 1) {
    console.log(`que et respon: "${cl[2]}"`);
    so += 1;
  }

  if (x === 57 && g2 === 4) {
    mar = 0;
    console.log('Un temporal ha enfonsat el vaixell ius ha deixat a la platja ..');
    pb = 0;
  }

  // Event: Bisbe
  if (g1 === 7 && g2 === 36 && x === 14 && din > 0) {
    console.log('I et respon: "');
    let id = l1[cx - 1 * w].length - 8;
    console.log(`PAX circa ${l1[cx - 1 * w].substring(10, id)}"`);
    so += 1;
    din = 0;
  }

  // Event: Gana
  if (si[5] === x) {
    ga = 1;
    if (ga === 1 && si[22] < 0) {
      console.log('però t\'has afartat amb els queviures que portaves.');
      si[22] = 35;
      ga = 0;
      si[5] = si[5] + 5;
    }
  }
}

// Call the function with appropriate arguments
handleLocationsAndEvents(g1, g2, x, si, cl, so, mar, co);





function checkGameStateAndActions(g1, g2, x, si, co, mar, pb) {
  if (right(co[19], 1) !== "a") {
    si[19] = 0;
  }
  if (right(co[20], 1) !== "a") {
    si[20] = 0;
  }
  console.log("Un temporal ha enfonsat el vaixell i us ha deixat a la platja ..");
  pb = 0;
}

// Helper function to get the right part of a string
function right(str, n) {
  return str.substring(str.length - n);
}

// Call the function with appropriate arguments
checkGameStateAndActions(g1, g2, x, si, co, mar, pb);




function handleGameResponses(g1, g2, x, si, cl, so, din) {
  if (g1 === 7 && g2 === 36 && x === 14 && din > 0) {
    console.log('I et respon : "');
    const id = l1[cx - 1 * w].length - 8;
    console.log(`PAX circa ${l1[cx - 1 * w].substring(10, id)}"`);
    so += 1;
    din = 0;
  }
}

// Call the function with appropriate arguments
handleGameResponses(g1, g2, x, si, cl, so, din);




function handleAdditionalEventsAndResponses(g1, g2, x, si, ga, co) {
  if (si[5] === x) {
    ga = 1;
    if (ga === 1 && si[22] < 0) {
      console.log("però t'has afartat amb els queviures que portaves.");
      si[22] = 35;
      ga = 0;
      si[5] = si[5] + 5;
    }
  }
}

// Call the function with appropriate arguments
handleAdditionalEventsAndResponses(g1, g2, x, si, ga, co);








function handleDialogueAndInteraction(g1, g2, si, so, cl, sa) {
  if (g1 === 12 && g2 === 10 && si[10] < 0) {
    console.log("I ara recordes, el títol del capítol que");
    console.log("diu : ODA a");
    for (let j = 1; j <= sa; j++) {
      console.log(so.charAt(sa - j + 1));
    }
    console.log();
    so += 1;
  }
}

// Call the function with appropriate arguments
handleDialogueAndInteraction(g1, g2, si, so, cl, sa);





function handleSpecificEvents(x, si, cl, so, l1, cx) {
  if (x === si[6]) {
    let ba = 1;
    if (ba === 1 && si[18] === -1) {
      console.log("Has fet fugir el bandoler !");
      ba = 0;
      return;
    }
    if (ba === 1 && si[17] === -1) {
      console.log("Has fet fugir el bandoler !");
      ba = 0;
      return;
    }
    if (ba === 1) {
      handleRobbery();
    }
  }
  // Event: Anell
  if (g1 === 27 && g2 === 12 && si[12] < 0) {
    console.log("Dins l'anell, trobes l'escut");
    console.log(`heràldic de ${l1[cx].substring(9)} ...`);
    so += 1;
  }
}

// Call the function with appropriate arguments
handleSpecificEvents(x, si, cl, so, l1, cx);




function handleSpecialGameEvents(x, g1, g2, so, cl, din) {
  // Event: Botafumeiro
  if (x === 77) {
    console.log("Dintre de la catedral, el botafumeiro escriu amb fum : ");
    console.log("- ");
    for (let j = 1; j <= sa; j += 2) {
      console.log(so.charAt(j) + " ");
    }
    console.log(" -");
    so += 1;
  }

  // Event: Character giving money
  if (g1 === 36 && g2 === 29) {
    console.log("Un dels oients et dóna diners i et diu : ");
    console.log(`"${cl[2]}"`);
    din += 10;
    so += 1;
  }
}

// Call the function with appropriate arguments
handleSpecialGameEvents(x, g1, g2, so, cl, din);









function navigateAndExecuteCommands(g1, g2, x, si, mar, pb, so, din, l1, cl) {
  // Handling navigation commands
  if (g1 === 15 && g2 === 19 && mar === 1) {
    console.log("Ets a dalt de la teva barca a punt de navegar ...");
    pb = 1;
  }
  if (g1 === 15 && g2 === 20 && mar === 1) {
    console.log("Ets a dalt del teu galió a punt de navegar ...");
    pb = 1;
  }

  // Handling specific events
  if (g1 === 13 && g2 === 15 && si[15] < 0) {
    console.log("Darrera el fòssil, veus uns signes rars: ");
    for (let j = 1; j <= sa; j++) {
      console.log(String.fromCharCode(203 + j) + String.fromCharCode(205 + j) + so.charAt(j - 1));
    }
    console.log(String.fromCharCode(203 + sa + 1) + String.fromCharCode(204 + sa + 2));
  }
}

// Call the function with appropriate arguments
navigateAndExecuteCommands(g1, g2, x, si, mar, pb, so, din, l1, cl);



function handleUserCommandsAndUpdateState(x, l1, si, din, mar) {
  // Display available directions based on current location
  console.log("POTS ANAR:");
  if (parseInt(l1[x].substring(0, 2)) > 0) {
    console.log("nord,");
  }
  if (parseInt(l1[x].substring(2, 4)) > 0) {
    console.log("sud,");
  }
  if (parseInt(l1[x].substring(4, 6)) > 0) {
    console.log("est,");
  }
  if (parseInt(l1[x].substring(6, 8)) > 0) {
    console.log("oest,");
  }
  console.log(".");
  console.log("QUE FAS ...?");
}

// Call the function with appropriate arguments
handleUserCommandsAndUpdateState(x, l1, si, din, mar);





function parseAndExecuteCommands(x, l1, pa, si, din, mar) {
  let e = 0;
  let x$ = prompt("Enter command: ").toLowerCase();
  
  // Find the first space in the command
  for (let j = 1; j <= x$.length; j++) {
    if (x$.charAt(j - 1) === " ") {
      e = j;
      break;
    }
  }
  
  if (e === 0) {
    e = x$.length + 2;
  }

  // Check for specific commands
  if (x$.includes("ajuda")) {
    // Handle 'ajuda' command
  }
  if (x$.includes("musica")) {
    // Handle 'musica' command
  }

  // Check for action words
  let g1 = 0;
  let g2 = 0;
  for (let j = 0; j < pa.length; j++) {
    if (x$.endsWith(pa[j].substring(pa[j].length - 4))) {
      g2 = j;
    }
    if (x$.startsWith(pa[j].substring(0, 4))) {
      g1 = j;
    }
  }
  
  // Execute actions based on parsed commands
  let t = g1 + g2;
  if (g1 === 23) g1 = 27;
  if (g1 === 35 || g1 === 19) g1 = 3;
  if (g1 === 28) g1 = 13;
  if (g1 === 25) g1 = 15;
  if (g1 === 26) g1 = 9;
  if (g1 === 29) g1 = 10;
  if (g1 === 16) g1 = 8;
  if (g1 === 24) g1 = 17;

  // Handle invalid commands
  if (g1 === 0 && g2 === 0) {
    console.log(`No entenc què vol dir "${x$}"`);
  }
}

// Call the function with appropriate arguments
parseAndExecuteCommands(x, l1, pa, si, din, mar);







function manageGameState(g1, g2, si, din, mar, pa) {
  if (g1 === 26) g1 = 9;
  if (g1 === 29) g1 = 10;
  if (g1 === 16) g1 = 8;
  if (g1 === 24) g1 = 17;
  if (g1 === 11 && g2 === 11) {
    console.log("ESTAS PORTANT: ");
    g2 = 1;
    handleInventory(si, din, mar, pa);
  }
}

function handleInventory(si, din, mar, pa) {
  let tm = "";
  if (din) tm += "Diners,";
  for (let j = 5; j <= 40; j++) {
    if (si[j] === -1) tm += pa[j].substring(7) + ",";
  }
  if (mar === 1) tm += "Títol Barca,";
  if (tm.length > 20) console.log();
  if (tm !== "") console.log(tm.slice(0, -1) + ".");
  else console.log("res.");
  
  for (let j = 1; j <= 1000; j++) {}
}

// Call the function with appropriate arguments
manageGameState(g1, g2, si, din, mar, pa);





function updateGameState(x, g1, g2, t, e, x$, pa) {
  if (g1 === 0 && g2 === 0) {
    console.log(`No entenc què vol dir "${x$}"`);
    return;
  }
  if (g1 > 0 && g2 === 0) {
    console.log(`${x$.substring(0, e)} què?`);
    return;
  }
  if (g1 === 0 && t > 0) {
    console.log(`No entenc què vol dir "${x$.substring(0, e)}"`);
    return;
  }
  // Further game state updates and error handling
}

// Call the function with appropriate arguments
updateGameState(x, g1, g2, t, e, x$, pa);





const locations = [
  "00000207l Pirineu, perdut",
  "00000301l Pirineu, perdut",
  "00000402l Pirineu, perdut",
  "00000503l Pirineu, perdut",
  "00000604l Pirineu, perdut",
  "00000705l Pirineu, perdut",
  "00000106l Pirineu, perdut",
  "01211276l bosc",
  "02221311l bosc",
  "03231412l bosc",
  "04241513 la SEU D'URGELL",
  "05251614l bosc",
  "06261715 BERGA",
  "07271816 RIPOLL",
  "07281917 OLOT",
  "07293018 ROSES",
  "11312276l bosc",
  "12322321 TREMP",
  "13332422l bosc",
  "14342523 SOLSONA",
  "15352624 CARDONA, davant del castell",
  "16362725 MOIA",
  "17372826 VIC",
  "18382927 GIRONA",
  "19399428 PALAMOS",
  "93390000 la platja, perdut",
  "21413276 LLEIDA",
  "22423331l bosc",
  "23433432l bosc",
  "24443533 CALAF",
  "25453634 MANRESA",
  "26463735l bosc",
  "27473836l MONTSENY",
  "28573937l bosc",
  "30570000 la platja, perdut",
  "25252525 una sala del castell",
  "31514276 FRAGA",
  "32524341 BORGES BLANQUES",
  "33534442l bosc",
  "34544543l bosc",
  "35554644 MONTSERRAT",
  "36564745 TERRASSA",
  "37573946 BADALONA",
  "00230000 dintre la cova, magatzem del bandoler",
  "41615276l bosc",
  "42625351 MONTBLANC",
  "43635452 SANTA CREUS",
  "44645553l bosc",
  "45655654l bosc",
  "46665755 BARCELONA",
  "39660000 la platja, perdut",
  "51716276l bosc",
  "52726361 CIURANA",
  "53736462 VALLS",
  "54746563 EL VENDRELL",
  "55756664l bosc",
  "57750000 la platja, perdut",
  "61817276 MORA D'EBRE",
  "62827371 FALSET",
  "63837472 REUS",
  "64939473 TARRAGONA",
  "66930000 la platja, perdut",
  "71918276 GANDESA",
  "72928381l bosc",
  "73937582l bosc",
  "81009276 TORTOSA",
  "82009391 AMPOSTA",
  "75300000 la platja, perdut",
  "68040000 L'AQUITANIA",
  "00670000 ANGLATERRA, a la cort del rei Ricard",
  " Cor de LLeó ...",
  "00003177l CAMI de SANTIAGO",
  "00007600 SANTIAGO DE COMPOSTELA",
  "91000000l PAIS VALENCIA",
  "00009557 alta mar",
  "00000094 MALLORCA, i en arribar : "
];



const actions = {
  "vaig nord": "",
  "      sud": "",
  "signo est": "",
  "     oest": "",
  "menjo bandoler": {
    description: "Un bandoler que t'intenta robar ...",
    state: 15
  },
  "pago   ploma": {
    description: "Una fabulosa ploma xinesa per escriure ...",
    state: 56
  },
  "segueix inscripcio": {
    description: "",
    state: 0
  },
  "agafo penya-segat": {
    description: "Un ferèstec penya-segat rocós ...",
    state: 30
  },
  "deixo  llibre": {
    description: "Un meravellós llibre de versos ...",
    state: 72
  },
  "farcell": "",
  "llegei anell": {
    description: "Un intrigant anell amb una ametista ...",
    state: 41
  },
  "examino": "",
  "    cofre": {
    description: "Un cofre meravellós, tancat"
  },
  "pujo   fossil": {
    description: "Un fòssil, dels utilitzats com a moneda prehistòrica ...",
    state: 49
  },
  "baixo  escala": {
    description: "Una escala de corda ...",
    state: 46
  },
  "mato   basto": {
    description: "Un bastó de noguera, amb el puny de plata ...",
    state: 22
  },
  "entro  punyal": {
    description: "Un gran punyal corbat, de plata ...",
    state: 53
  },
  "firmo  barca": {
    description: "Una bonica barca de pescadors, posada a la venda.",
    state: 29
  },
  "       galio": {
    description: "Un magnífic galió, en venda.",
    state: 74
  },
  "     torrent": "",
  "entro  queviures": {
    description: "Uns quants queviures de tota mena ..",
    state: 35
  },
  "destap documents": {
    description: "Uns documents que et presenten ...",
    state: 68
  },
  "assassicova": {
    description: "Una gran cova, amagada ",
    state: 50
  },
  "m'enfilo": {
    description: "Un torrent de muntanya que te la direcció del vent ...",
    state: 6
  },
  "prenc vall": {
    state: 3
  },
  "obro cova": {
    description: "Una gran cova, amagada per la vegetació ...",
    state: 23
  },
  "observo": "",
  "abandonsirventes": {
    description: "",
    state: 0
  },
  "descansArondeta": {
    description: "a la teva estimada Arondeta ...",
    state: 16
  },
  "compro Hugh de Mataplana": {
    description: "al teu conegut Hugh de Mataplana ...",
    state: 27
  },
  "venc Guillem Folch de Cardona": {
    description: "al teu enemic vital, el Comte de Cardona ...",
    state: 40
  },
  "escric Bisbe de la seu": {
    description: "al Bisbe de la Seu, que et demana el delme ...",
    state: 14
  },
  "festejocastell": "",
  "rubricbarquer": {
    description: "al barquer de l'Ebre que vol cobrar ...",
    state: 91
  },
  "       barquer": {
    description: "al barquer de l'Ebre que vol cobrar ...",
    state: 92
  },
  "recito delme": ""
};

const possibleActions = "ACCIONS POSSIBLES: VAIG SIGNO MENJO PAGO SEGUEIXO AGAFO DEIXO LLEGEIXO EXAMINO PUJO BAIXO MATO ENTRO FIRMO DESTAPO ASSASSINO M'ENFILO PRENC OBRO OBSERVO ABANDONO DESCANSO COMPRO VENC ESCRIC FESTEJO RUBRICO RECITO".split(" ");







function executeUserCommandsAndUpdateState(x, l1, g1, g2) {
  // Command prohibitions
  if (g2 === 1 && parseInt(l1[x].substring(0, 2)) === 0) {
    console.log("No pots fer-ho");
    return;
  }
  if (g2 === 2 && parseInt(l1[x].substring(2, 4)) === 0) {
    console.log("T'és impossible");
    return;
  }
  if (g2 === 3 && parseInt(l1[x].substring(4, 6)) === 0) {
    console.log("No t'hi empenyis");
    return;
  }
  if (g2 === 4 && parseInt(l1[x].substring(6, 8)) === 0) {
    console.log("No pots anar-hi");
    return;
  }

  // Dynamic state updates
  if (g1 === 1 && g2 === 1) x = parseInt(l1[x].substring(0, 2));
  if (g1 === 1 && g2 === 2) x = parseInt(l1[x].substring(2, 4));
  if (g1 === 1 && g2 === 3) x = parseInt(l1[x].substring(4, 6));
  if (g1 === 1 && g2 === 4) x = parseInt(l1[x].substring(6, 8));
  
  return x;
}

// Call the function with appropriate arguments
executeUserCommandsAndUpdateState(x, l1, g1, g2);






function additionalCommandHandlingAndStateUpdates(g1, g2, si, din, mar, pa) {
  if (g1 === 9) {
    // Handle specific command for action "agafo" (take)
    // ... (rest of the handling logic)
  } else if (g1 === 31) {
    // Handle specific command for action "compro" (buy)
    // ... (rest of the handling logic)
  } else {
    // Handle other commands
    if (g2 > 18 && g2 < 21) {
      console.log("No et deixen !");
    } else if (g2 === 30 || g2 === 31 || g2 === 32 || g2 === 33 || g2 === 60 || g2 === 35 || g2 === 38) {
      console.log("No et deixa !");
    } else if (g2 === 26 || g2 === 9 || g2 === 24) {
      console.log("No pots !");
    } else {
      // ... (further command handling)
    }
  }
}

// Call the function with appropriate arguments
additionalCommandHandlingAndStateUpdates(g1, g2, si, din, mar, pa);








function handleSpecificGameEvents(si, x, din, co, pa) {
  if (fa > 1) {
    console.log("No pots carrregar tant !");
    return;
  }
  for (let j = 5; j < 40; j++) {
    if (si[g2] == x) {
      si[g2] = -1;
      return;
    }
  }
  console.log("No hi cap " + x.slice(e));
}






function manageGameEvents(si, x, din, mar, co, pa) {
  if (g1 === 10) {
    if (g2 === 20 || g2 === 19) {
      console.log("Quin pes t'has tret !");
      din += 50;
    }
    for (let j = 5; j < 40; j++) {
      if (si[g2] === -1) {
        si[g2] = x;
        return;
      }
    }
    console.log("No portes cap " + x.slice(e));
  }
}




function finalizeEventsAndUpdateState(si, din, co, x, mar) {
  if (mar === 1) {
    din += 50;
    mar = 0;
  }
  if (co[19].slice(-2) !== "a.") {
    co[19] += "\b, en venda.";
  }
  if (co[20].slice(-2) !== "a.") {
    co[20] += "\b, en venda.";
  }
  for (let j = 5; j < 40; j++) {
    if (si[g2] === -1) {
      si[g2] = x;
      din += 10;
      return;
    }
  }
  console.log("No tens cap " + x.slice(e));
}







function handleMiscellaneousScenarios(g1, g2, x, si, din, co, mar) {
  // Arondeta scenario
  if (g1 === 34 && g2 !== 30) {
    console.log("No es deixa !");
    return;
  }
  if (g1 === 34 && x !== 16) {
    console.log("No hi és !");
    return;
  }

  // Roca scenario
  if (g1 === 16 && g2 === 26 && x === 3) {
    x = 67;
    return;
  }
  if (g1 === 16 && g2 !== 26) {
    console.log("Què dius que fas ?");
    return;
  }

  // Various checks and responses
  if (g1 === 12 && g2 !== 8 && g2 !== 10) {
    console.log("Què dius ?");
    return;
  }
  if (g1 === 12 && g2 === 10 && x !== si[10] && si[10] > 0) {
    console.log("No hi ha cap llibre !");
    return;
  }
  if (g1 === 16 && g2 !== 26) {
    console.log("Què dius ?");
    return;
  }
  if (g1 === 13 && g2 !== 25 && g2 !== 11 && g2 !== 15) {
    console.log("Què dius que fas ?");
    return;
  }

  // Additional scenarios
  if (g1 === 8 && g2 === 21 && x === 6) {
    x = 14;
    return;
  }
  if (g1 === 8 && g2 === 26 && x === 3) {
    x = 67;
    return;
  }
  if (g1 === 15 && g2 === 9 && x !== 30 && x !== 75) {
    console.log("No hi ha penya-segat");
    return;
  }
  if (g1 === 15 && g2 === 9 && x === 30) {
    x = 29;
    return;
  }
  if (g1 === 15 && g2 === 9 && x === 75) {
    x = 74;
    return;
  }

  // Vaixells scenario
  if (x === 94 && (mar === 0 || pb === 0)) {
    console.log("T'HAS OFEGAT.");
    return;
  }

  // Cardona scenario
  if (g1 === 17 && g2 === 32 && x !== 40) {
    console.log("No és aquí !");
    return;
  }
  if (g1 === 17 && g2 !== 32) {
    console.log("No es deixa");
    return;
  }
  if (g1 === 17 && si[17] > 0 && si[18] > 0) {
    console.log("Amb què ?");
    return;
  }

  // Mataplana scenario
  if (g1 === 33 && g2 !== 29) {
    console.log("No creus que perds el temps ...");
    return;
  }
  if (g1 === 33 && g2 === 29 && si[7] > 0) {
    console.log("amb què l'escrius ?");
    return;
  }
  if (g1 === 3 && g2 === 23 && si[7] > 0) {
    console.log("Amb què els signes ?");
    return;
  }

  // Mallorca scenario
  if (x === 95) {
    console.log("Et trobes un moro que et diu : 'A on vas?'");
    return;
  }

  // Anglaterra scenario
  if (g1 === 3 && g2 !== 23) {
    console.log("No volen autògrafs !");
    return;
  }

  // Cofre scenario
  if (g1 === 27 && g2 !== 14 && g2 !== 12) {
    console.log("No pots !");
    return;
  }
  if (g1 === 27 && g2 === 14 && x !== cx) {
    console.log("No hi és !");
    return;
  }

  // Escalada del castell scenario
  if (g1 === 15 && g2 === 34 && si[16] === -1) {
    x = 40;
    return;
  }
  if (g1 === 15 && g2 === 34 && x !== 40) {
    console.log("A on vols pujar ?");
    return;
  }
  if (g1 === 15 && g2 === 34 && si[16] > 0) {
    console.log("No tens cap escala !");
    return;
  }
  if (g1 === 15 && g2 !== 9 && g2 !== 34 && g2 !== 19 && g2 !== 20) {
    console.log("No perds una mica el temps ?");
    return;
  }

  // Various other checks and responses
  if (g1 === 7 && (g2 === 35 || g2 === 38) && x === 91 || x === 92 && din < 1) {
    console.log("No tens prou diners !");
    return;
  }
  if (x < 91 || x > 92 && g1 === 7 && (g2 === 35 || g2 === 38)) {
    console.log("No hi ha cap barquer !");
    return;
  }
  if (g1 === 7 && g2 === 35 || g2 === 38 && x === 91 || x === 92 && din > 1) {
    din = 0;
    x = 85;
    return;
  }
  if (g1 === 7 && g2 === 36 && x === 14 && din < 1) {
    console.log("No tens prou diners !");
    return;
  }
  if (g1 === 7 && g2 < 35) {
    console.log("No t'ho accepta");
    return;
  }

  // Cova scenario
  if (g1 === 22 && g2 === 27 && x === 23) {
    x = 49;
    return;
  }
  if (g1 === 22 && g2 !== 27) {
    console.log("A on dius que vas ?");
    return;
  }
  if (g1 === 6 && g2 !== 22) {
    console.log("No és comestible !");
    g1 = 17;
    g2 = 33;
    return;
  }
  if (g1 === 6 && g2 === 22 && si[22] > 0) {
    console.log("No tens queviures !");
    return;
  }
  if (g1 === 12 && g2 === 10 && si[10] > 0) {
    console.log("No arribes a veure'l !");
    return;
  }

  // Anell scenario
  if (g1 === 27 && g2 === 12 && si[12] === x) {
    console.log("Però si no el tens !");
    return;
  }
  if (g1 === 36 && g2 !== 29) {
    console.log("Què dius que recites ?");
    return;
  }
  if (g1 === 36 && g2 !== 29) {
    console.log("Estàs perdent el temps.");
    return;
  }

  // Final checks
  if (g1 === 15 && g2 === 19 && mar === 0) {
    console.log("No et deixen ,perquè no és teva");
    return;
  }
  if (g1 === 15 && g2 === 20 && mar === 0) {
    console.log("No et deixen ,perquè no és teu");
    return;
  }
  if (g1 === 13 && g2 === 15 && si[15] > 0) {
    console.log("No el tens a l'abast");
    return;
  }
  if (g1 === 27 && g2 !== 12 && g2 !== 14) {
    console.log("Ets un males mans d'intencions, però no pots destapar-ho !");
    return;
  }
}

// Call the function with appropriate arguments
handleMiscellaneousScenarios(g1, g2, x, si, din, co, mar);




















function handleMiscellaneousScenarios(g1, g2, x, si, din, co, mar) {
  // Handle various scenarios and interactions
  if (g1 === 1) {
    // Example scenario
    console.log("Handling scenario 1");
    return;
  }

  // Additional scenarios from lines 4180 to the end
  // Example: Handle scenario based on g1 and g2 values
  if (g1 === 34 && g2 !== 30) {
    console.log("No es deixa !");
    return;
  }
  if (g1 === 34 && x !== 16) {
    console.log("No hi és !");
    return;
  }
  
  if (g1 === 16 && g2 === 26 && x === 3) {
    x = 67;
    return;
  }
  if (g1 === 16 && g2 !== 26) {
    console.log("Què dius que fas ?");
    return;
  }
  
  if (g1 === 12 && g2 !== 8 && g2 !== 10) {
    console.log("Què dius ?");
    return;
  }
  if (g1 === 12 && g2 === 10 && x !== si[10] && si[10] > 0) {
    console.log("No hi ha cap llibre !");
    return;
  }
  if (g1 === 16 && g2 !== 26) {
    console.log("Què dius ?");
    return;
  }
  if (g1 === 13 && g2 !== 25 && g2 !== 11 && g2 !== 15) {
    console.log("Què dius que fas ?");
    return;
  }
  
  if (g1 === 8 && g2 === 21 && x === 6) {
    x = 14;
    return;
  }
  if (g1 === 8 && g2 === 26 && x === 3) {
    x = 67;
    return;
  }
  if (g1 === 15 && g2 === 9 && x !== 30 && x !== 75) {
    console.log("No hi ha penya-segat");
    return;
  }
  if (g1 === 15 && g2 === 9 && x === 30) {
    x = 29;
    return;
  }
  if (g1 === 15 && g2 === 9 && x === 75) {
    x = 74;
    return;
  }
  
  if (x === 94 && (mar === 0 || pb === 0)) {
    console.log("T'HAS OFEGAT.");
    return;
  }
  
  if (g1 === 17 && g2 === 32 && x !== 40) {
    console.log("No és aquí !");
    return;
  }
  if (g1 === 17 && g2 !== 32) {
    console.log("No es deixa");
    return;
  }
  if (g1 === 17 && si[17] > 0 && si[18] > 0) {
    console.log("Amb què ?");
    return;
  }
  
  if (g1 === 33 && g2 !== 29) {
    console.log("No creus que perds el temps ...");
    return;
  }
  if (g1 === 33 && g2 === 29 && si[7] > 0) {
    console.log("amb què l'escrius ?");
    return;
  }
  if (g1 === 3 && g2 === 23 && si[7] > 0) {
    console.log("Amb què els signes ?");
    return;
  }
  
  if (x === 95) {
    console.log("Et trobes un moro que et diu : 'A on vas?'");
    return;
  }
  
  if (g1 === 3 && g2 !== 23) {
    console.log("No volen autògrafs !");
    return;
  }
  
  if (g1 === 27 && g2 !== 14 && g2 !== 12) {
    console.log("No pots !");
    return;
  }
  if (g1 === 27 && g2 === 14 && x !== cx) {
    console.log("No hi és !");
    return;
  }
  
  if (g1 === 15 && g2 === 34 && si[16] === -1) {
    x = 40;
    return;
  }
  if (g1 === 15 && g2 === 34 && x !== 40) {
    console.log("A on vols pujar ?");
    return;
  }
  if (g1 === 15 && g2 === 34 && si[16] > 0) {
    console.log("No tens cap escala !");
    return;
  }
  if (g1 === 15 && g2 !== 9 && g2 !== 34 && g2 !== 19 && g2 !== 20) {
    console.log("No perds una mica el temps ?");
    return;
  }
  
  if (g1 === 7 && (g2 === 35 || g2 === 38) && x === 91 || x === 92 && din < 1) {
    console.log("No tens prou diners !");
    return;
  }
  if (x < 91 || x > 92 && g1 === 7 && (g2 === 35 || g2 === 38)) {
    console.log("No hi ha cap barquer !");
    return;
  }
  if (g1 === 7 && g2 === 35 || g2 === 38 && x === 91 || x === 92 && din > 1) {
    din = 0;
    x = 85;
    return;
  }
  if (g1 === 7 && g2 === 36 && x === 14 && din < 1) {
    console.log("No tens prou diners !");
    return;
  }
  if (g1 === 7 && g2 < 35) {
    console.log("No t'ho accepta");
    return;
  }
  
  if (g1 === 22 && g2 === 27 && x === 23) {
    x = 49;
    return;
  }
  if (g1 === 22 && g2 !== 27) {
    console.log("A on dius que vas ?");
    return;
  }
  if (g1 === 6 && g2 !== 22) {
    console.log("No és comestible !");
    g1 = 17;
    g2 = 33;
    return;
  }
  if (g1 === 6 && g2 === 22 && si[22] > 0) {
    console.log("No tens queviures !");
    return;
  }
  if (g1 === 12 && g2 === 10 && si[10] > 0) {
    console.log("No arribes a veure'l !");
    return;
  }
  
  if (g1 === 27 && g2 === 12 && si[12] === x) {
    console.log("Però si no el tens !");
    return;
  }
  if (g1 === 36 && g2 !== 29) {
    console.log("Què dius que recites ?");
    return;
  }
  if (g1 === 36 && g2 !== 29) {
    console.log("Estàs perdent el temps.");
    return;
  }
  
  if (g1 === 15 && g2 === 19 && mar === 0) {
    console.log("No et deixen ,perquè no és teva");
    return;
  }
  if (g1 === 15 && g2 === 20 && mar === 0) {
    console.log("No et deixen ,perquè no és teu");
    return;
  }
  if (g1 === 13 && g2 === 15 && si[15] > 0) {
    console.log("No el tens a l'abast");
    return;
  }
  if (g1 === 27 && g2 !== 12 && g2 !== 14) {
    console.log("Ets un males mans d'intencions, però no pots destapar-ho !");
    return;
  }
}

// Call the function with appropriate arguments
handleMiscellaneousScenarios(g1, g2, x, si, din, co, mar);
