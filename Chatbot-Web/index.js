document.getElementById("send-button").addEventListener("click", sendMessage);

async function sendMessage() {
  const userInput = document.getElementById("user-input").value;
  document.getElementById("user-input").value = "";
  let promptEle = document.querySelector("#prompt");
  promptEle.textContent = userInput;
  promptEle.style.visibility = "visible";

  let avatarEle = document.querySelector("#pic");
  avatarEle.style.visibility = "visible";

  let responseEle = document.querySelector("#response");
  responseEle.style.visibility = "visible";
  responseEle.textContent = "...";

  const apiKey = API_KEY;
  const url = `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=${apiKey}`;

  const data = {
    system_instruction: {
      parts: {
        text: "You are Vegeta from Dragon Ball Z. Respond like him.",
      },
    },
    contents: [
      {
        parts: [
          {
            text: userInput,
          },
        ],
      },
    ],
  };

  const response = await fetch(url, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  });

  const responseData = await response.json();
  console.log(responseData);
  const unwrappedResponse = responseData.candidates[0].content.parts[0].text;

  responseEle.textContent = unwrappedResponse;
  // responseEle.style.visibility = "visible";
}
