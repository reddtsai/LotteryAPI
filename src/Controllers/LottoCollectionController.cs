using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

using LotteryAPI.Models;
using lotteryapi.Repositories;

namespace LotteryAPI.Controllers
{
    [ApiController]
    // [Route("api/[controller]")]
    // [Route("api/[controller]/[action]")]
    [Route("api/lotto649")]
    public class Lotto649CollectionController : ControllerBase
    {
        private readonly LotteryContext _lotteryContext;
        private readonly ILogger<Lotto649CollectionController> _logger;

        public Lotto649CollectionController(LotteryContext lotteryContext, ILogger<Lotto649CollectionController> logger)
        {
            _lotteryContext = lotteryContext ?? throw new ArgumentNullException(nameof(lotteryContext));
            _logger = logger;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var rows = _lotteryContext.Lotto649.ToList();
            return Ok(rows);
        }

        [HttpGet("{term}")]
        public IActionResult Get(int term)
        {
            var row = _lotteryContext.Lotto649.Find(term);
            return Ok(row);
        }
    }
}